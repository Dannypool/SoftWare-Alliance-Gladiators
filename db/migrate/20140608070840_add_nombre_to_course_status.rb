class AddNombreToCourseStatus < ActiveRecord::Migration
  def change
    add_column :course_statuses, :nombre, :string
  end
end
