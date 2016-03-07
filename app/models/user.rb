class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable, :confirmable

  enum role: [:standard, :premium, :admin ]

  #Associations
  has_many :wikis

  #Validations


  validates :role, inclusion: { in: roles.keys ,
            message: "%{value} is not a valid role" }

  #Callbacks 

  before_save { self.role ||= :standard }

  #Class Methods

  #Instance Methods

  def upgrade_to_premium
    return false unless self.role == :standard
    current_user.update_attributes(role: :premium)
    return true
  end

  def downgrade_to_standard
    return false unless self.role == :premium
    ActiveRecord::Base.transaction do
      current_user.wikis.each do |wiki|
        wiki.update_attributes(private: false)
      end
      current_user.update_attributes(role: :standard)
    end
    return true
  end

private #----------------------------------------------

end
