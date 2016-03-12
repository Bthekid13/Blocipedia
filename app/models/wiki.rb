class Wiki < ActiveRecord::Base
  belongs_to :topic
  has_many :collaborations
  has_many :users, through: :collaborations

  def collaborations_for(current_user)
    collaborations.where(user: user).first
  end


end
