class AddFechaInicioFechaFinToTranningCourse < ActiveRecord::Migration
  def change
    add_column :trainning_courses, :fecha_inicio, :date
    add_column :trainning_courses, :fecha_fin, :date
  end
end
