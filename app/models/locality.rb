class Locality < ActiveRecord::Base
  attr_accessible :localidad, :municipality_id

  belongs_to :municipality
end
