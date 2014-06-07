class Education < ActiveRecord::Base
  attr_accessible :nombre, :person_id, :school_type_id
  belongs_to :person_id
end
