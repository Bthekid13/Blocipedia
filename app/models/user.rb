class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable, :confirmable

  enum role: [:standard, :premium, :admin ]

  #Associations
  has_many :wikis
  has_many :collaborations
  has_many :shared_wikis, through: :collaborations, source: :wiki   #This is used when there's a name conflict.

  # Scopes

  # Returns Public Wikis
    scope :public_wikis, -> { where(private: false) }
  # Returns User's Wikis
    scope :personal_wikis, -> (user)  { where(user: user) }
  # Returns User's Collaborations
    scope :shared_wikis, -> (user) { joins(:collaborations).where({ collaborations: { user: user } }) }



  #Validations

  #Hooks
  after_initialize :set_default_role, :if => :new_record?

  #Class Methods
  # def role_change
  #   ActiveRecord::Base.transaction do
  #     if User.update_attributes(role: 1)
  #       User.update_attributes(private: false)
  #     end
  #   end
  # end

  #Instance Methods

  # def email
  #   "#{email.first}."
  # end

private #-----------------------------------------

  def set_default_role
    self.role ||= :standard
  end
end
