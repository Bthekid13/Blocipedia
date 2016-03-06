class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  #:lockable, :timeoutable and :omniauthable
  after_initialize :set_default_role, :if => :new_record?

  has_many :wikis
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable, :confirmable

  enum role: [:admin, :standard, :premium ]

  def set_default_role
    self.role ||= :standard
  end

  # def role_change
  #   ActiveRecord::Base.transaction do
  #     if User.update_attributes(role: 1)
  #       User.update_attributes(private: false)
  #     end
  #   end
  # end
end
