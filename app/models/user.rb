class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable, :confirmable

  enum role: [:standard, :premium, :admin ]

  #Associations
  has_many :wikis
  has_many :collaborations
  has_many :shared_wikis, through: :collaborations, source: :wikis   #This is used when there's a name conflict.

  # Scopes


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
