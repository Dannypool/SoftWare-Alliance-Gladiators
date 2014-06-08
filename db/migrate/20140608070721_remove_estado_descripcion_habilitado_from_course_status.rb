class RemoveEstadoDescripcionHabilitadoFromCourseStatus < ActiveRecord::Migration
  def up
    remove_column :course_statuses, :estado
    remove_column :course_statuses, :descripcion
    remove_column :course_statuses, :habilitado
  end

  def down
    add_column :course_statuses, :habilitado, :string
    add_column :course_statuses, :descripcion, :string
    add_column :course_statuses, :estado, :string
  end
end
