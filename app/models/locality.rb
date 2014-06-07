class Locality < ActiveRecord::Base
  attr_accessible :localidad, :municipality_id
  has_many :venues
  has_many :addresses
  belongs_to :municipality
end
