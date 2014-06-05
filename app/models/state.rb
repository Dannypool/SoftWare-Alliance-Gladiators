class State < ActiveRecord::Base
  attr_accessible :states
  has_many :municipalities
end
