class AllocatedFigure < ActiveRecord::Base
  attr_accessible :activity_id, :fecha_fin, :fecha_inicio, :person_id, :status

  belongs_to :activity
  belongs_to :person
  has_many :training_figures
  has_many :attendances


end
