# == Schema Information
#
# Table name: wikis
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  private    :boolean
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  topic_id   :integer
#  users_id   :integer
#

class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :collaborations
  has_many :users, through: :collaborations

  #validations
  validates :title, length: {minimum: 5}, presence: true
  validates :body, length: {minimum: 15}, presence: true


# Scopes

# Returns Public Wikis
  scope :public_wikis, -> { where(private: false) }
# Returns User's Wikis
  scope :personal_wikis, -> (user) { where(user: user) }
# Returns User's Collaborations
  scope :shared_wikis, -> (user) { joins(:collaborations).where({ collaborations: { user: user } }) }



end
