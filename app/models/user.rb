class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  #:lockable, :timeoutable and :omniauthable
  enum role: [:admin, :standard, :premium ]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :standard
  end

  has_many :wikis
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable, :confirmable






end
