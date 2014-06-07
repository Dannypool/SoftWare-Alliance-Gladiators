class TrainningCourse < ActiveRecord::Base
  attr_accessible :course_id, :course_status_id, :education_type_id, :language_id, :municipality_id, :no_asistencias
end
