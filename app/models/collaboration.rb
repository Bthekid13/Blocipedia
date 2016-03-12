class Collaboration < ActiveRecord::Base
  has_many :users
  has_many :wikis
end
