# == Schema Information
#
# Table name: collaborations
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  wiki_id    :integer
#

class Collaboration < ActiveRecord::Base
  belongs_to :user
  belongs_to :wiki
end
