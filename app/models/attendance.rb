class Attendance < ActiveRecord::Base
  attr_accessible :allocated_figure_id, :evaluacion, :moment_momento, :moment_year, :observacion
  belongs_to :allocated_figure
end
