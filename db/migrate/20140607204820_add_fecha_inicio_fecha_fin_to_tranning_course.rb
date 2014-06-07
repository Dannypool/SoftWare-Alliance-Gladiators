class AddFechaInicioFechaFinToTranningCourse < ActiveRecord::Migration
  def change
    add_column :tranning_courses, :fecha_inicio, :date
    add_column :tranning_courses, :fecha_fin, :date
  end
end
