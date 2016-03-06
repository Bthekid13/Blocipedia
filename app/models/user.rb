class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  #:lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable,
  :rememberable, :trackable, :validatable, :confirmable
  has_many :wikis
  enum role: [:admin, :standard, :premium ]
  after_initialize :set_default_role, :if => :new_record?



  def set_default_role
    self.role ||= :standard
  end

  


end
