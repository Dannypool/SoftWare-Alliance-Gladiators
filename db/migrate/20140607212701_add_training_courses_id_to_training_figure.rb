class AddTrainingCoursesIdToTrainingFigure < ActiveRecord::Migration
  def change
    add_column :training_figures, :training_courses_id, :integer
  end
end
