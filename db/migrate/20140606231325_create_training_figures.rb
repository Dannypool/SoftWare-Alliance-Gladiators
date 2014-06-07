class CreateTrainingFigures < ActiveRecord::Migration
  def change
    create_table :training_figures do |t|
      t.integer :allocated_figure_id
      t.integer :training_courses
      t.string :calificacion

      t.timestamps
    end
  end
end
