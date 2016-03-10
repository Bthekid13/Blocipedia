class Wiki < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user
  has_many :collaborators
  has_many :users, through: :collaborators


end
