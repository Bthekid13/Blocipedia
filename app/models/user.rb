class User < ActiveRecord::Base
  enum role: [:admin, :standard, :premium ]
  after_initialize :set_default_role, :if => :new_record?



  has_many :wikis
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable, :confirmable

private #-----------------------------------------

  def set_default_role
    self.role ||= :standard
  end

end
