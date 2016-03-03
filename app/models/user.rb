class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable, :confirmable
  enum role: [:standard, :premium, :admin ]
  #Associations
  has_many :wikis

  #Validations

  #Hooks
  #after_initialize :set_default_role, :if => :new_record?

  #Class Methods

  #Instance Methods

private #-----------------------------------------

  def set_default_role
    self.role ||= :standard
  end

end
