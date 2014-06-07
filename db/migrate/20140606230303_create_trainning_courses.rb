class CreateTrainningCourses < ActiveRecord::Migration
  def change
    create_table :trainning_courses do |t|
      t.integer :municipality_id
      t.integer :course_id
      t.integer :education_type_id
      t.integer :language_id
      t.integer :course_status_id
      t.integer :no_asistencias

      t.timestamps
    end
  end
end
