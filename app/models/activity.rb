class Activity < ActiveRecord::Base
  attr_accessible :education_type_id, :language_id, :necesidad, :venue_id, :venue_locality_id

  has_many :allocated_figures
  has_many :persons, :through => :allocated_figures
  belongs_to :education_type
  belongs_to :venue
  belongs_to :language

end
