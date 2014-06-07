class CourseStatus < ActiveRecord::Base
  attr_accessible :descripcion, :estado, :habilitado
  has_many :trainning_courses
end
