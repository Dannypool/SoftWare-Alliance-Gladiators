class CreateCourseStatuses < ActiveRecord::Migration
  def change
    create_table :course_statuses do |t|
      t.string :estado
      t.string :descripcion
      t.string :habilitado

      t.timestamps
    end
  end
end
