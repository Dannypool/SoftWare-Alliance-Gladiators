class RemoveTrainingCoursesFromTrainingFigure < ActiveRecord::Migration
  def up
    remove_column :training_figures, :training_courses
  end

  def down
    add_column :training_figures, :training_courses_id, :integer
  end
end
