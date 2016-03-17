class Wiki < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user
  has_many :collaborations
  has_many :users, through: :collaborations


# Scopes

  scope :public_wikis, -> { where(private: false) }
  scope :personal_wikis, -> (user) { joins(collaborations: user) }

# Returns User's Collaborations



  # scope.where(user: @user) + scope.joins(:users)


end
