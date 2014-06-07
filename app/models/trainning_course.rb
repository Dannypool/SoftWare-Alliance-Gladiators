class TrainningCourse < ActiveRecord::Base
  attr_accessible :course_id, :course_status_id, :education_type_id, :language_id, :municipality_id, :no_asistencias, :fecha_inicio, :fecha_fin
  has_many :training_figures
  belongs_to :municipality
  belongs_to :course
  belongs_to :education_type
  belongs_to :language
  belongs_to :course_status


end
