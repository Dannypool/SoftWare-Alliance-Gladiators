class Venue < ActiveRecord::Base
  attr_accessible :locality_id, :localizacion
  belongs_to :locality
  has_many :activities
end
