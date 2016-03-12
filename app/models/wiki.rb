class Wiki < ActiveRecord::Base
  #Associations
  belongs_to :topic
  belongs_to :user

  has_many :users, through: :collaborations


end
