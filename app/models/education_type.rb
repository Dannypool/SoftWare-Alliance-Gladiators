class EducationType < ActiveRecord::Base
  attr_accessible :nombre
  has_many :trainning_courses
end
