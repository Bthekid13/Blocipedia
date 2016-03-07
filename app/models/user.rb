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

private #----------------------------------------------

end
