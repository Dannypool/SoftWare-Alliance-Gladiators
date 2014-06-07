class EducationalLevel < ActiveRecord::Base
  attr_accessible :nombre
  has_many :school_types
end
