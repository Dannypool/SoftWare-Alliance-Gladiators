class State < ActiveRecord::Base
  attr_accessible :estado
  has_many :municipalities
end
