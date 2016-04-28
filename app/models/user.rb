class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable, :confirmable

  enum role: [:standard, :premium, :admin ]

  #Associations
  has_many :wikis
  has_many :collaborations
  has_many :shared_wikis, through: :collaborations, source: :wiki
  #This is used when there's a name conflict.

  # Scopes

  # Returns Public Wikis
    scope :public_wikis, -> { where(private: false) }
  # Returns User's Wikis
    scope :personal_wikis, -> (user)  { where(user: user) }
  # Returns User's Collaborations
    scope :shared_wikis, -> (user) { joins(:collaborations).where({ collaborations: { user: user } }) }



  #Validations


  validates :role, inclusion: { in: roles.keys ,
            message: "%{value} is not a valid role" }

  #Callbacks

  before_save { self.role ||= :standard }

  #Class Methods

  #Instance Methods


  # def email
  #   "#{email.first}."
  # end

private #-----------------------------------------

  def downgrade_to_standard
    return false unless self.role.to_sym == :premium
    ActiveRecord::Base.transaction do
      wikis.each do |wiki|
        wiki.update_attributes(private: false)
      end
      update_attributes(role: :standard)
    end
    return true
  end

private #----------------------------------------------


end
