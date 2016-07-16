# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  role                   :integer          default(0), not null
#  collaboration_id       :integer
#  name                   :string
#

class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable,
  :rememberable, :trackable, :validatable

  enum role: [:standard, :premium, :admin ]

  #Associations
  has_many :wikis, dependent: :destroy
  has_many :collaborations
  has_many :shared_wikis, through: :collaborations, source: :wiki
  #This is used when there's a name conflict.

  # validations
  #
  validates :name, presence: true, length: {minimum: 2, maximum: 26}

  validates :email, uniqueness: {case_sensitive: false },
  presence: true, length: { minimum: 3 }

  validates :role, presence: true,
  inclusion: { in: roles.keys, message: "%{value} is not a valid role" }

  # Returns Public Wikis
  scope :public_wikis, -> { where(private: false) }
  # Returns User's Wikis
  scope :personal_wikis, -> (user)  { where(user: user) }
  # Returns User's Collaborations
  scope :shared_wikis, -> (user) { joins(:collaborations).where({ collaborations: { user: user } }) }


  #Validations


  validates :role, inclusion: { in: roles.keys ,
    message: "%{value} is not a valid role" }

    #Callbacks

    before_save { self.role ||= :standard }

    def upgrade_to_premium
      return false unless self.role.to_sym == :standard
      update_attributes(role: :premium)
      return true
    end

    def downgrade_to_standard
      return false unless self.role.to_sym == :premium
      ActiveRecord::Base.transaction do
        wikis.each do |wiki|
          wiki.update_attributes(private: false)
        end
        update_attributes(role: :standard)
      end
      return true
    end

    private #----------------------------------------------


  end
