class Address < ActiveRecord::Base
  attr_accessible :calle, :colonia, :fecha_de_actualizacion, :locality_id, :numero, :person_id
  belongs_to :locality
  belongs_to :person
end
