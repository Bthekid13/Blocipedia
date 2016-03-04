class Wiki < ActiveRecord::Base
  belongs_to :user

  scope :private_showing, -> { where(private: true) }

  scope :visible_to, -> (user) { user ? all : where(private: false) }

end
