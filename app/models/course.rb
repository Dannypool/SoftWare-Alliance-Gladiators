class Course < ActiveRecord::Base
  attr_accessible :description, :nombre, :status
  has_many :trainning_courses
end
