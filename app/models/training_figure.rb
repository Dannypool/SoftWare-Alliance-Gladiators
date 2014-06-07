class TrainingFigure < ActiveRecord::Base
  attr_accessible :allocated_figure_id, :calificacion, :training_courses

  belongs_to :allocated_figure
  belongs_to :trainning_course

end
