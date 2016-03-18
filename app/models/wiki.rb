class Wiki < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user
  has_many :collaborations
  has_many :users, through: :collaborations


# Scopes

# Returns Public Wikis
  scope :public_wikis, -> { where(private: false) }
# Returns User's Wikis
  scope :personal_wikis, -> (user) { where(user: user) }
# Returns User's Collaborations
  scope :shared_wikis, -> (user) { joins(:collaborations).where({ collaborations: { user: user } }) }



end
