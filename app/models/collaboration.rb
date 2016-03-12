class Collaboration < ActiveRecord::Base
  belongs_to :wiki
  belongs_to :user
end
