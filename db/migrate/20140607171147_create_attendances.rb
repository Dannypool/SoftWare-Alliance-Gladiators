class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.integer :allocated_figure_id
      t.integer :evaluacion
      t.string :observacion
      t.integer :moment_momento
      t.integer :moment_year

      t.timestamps
    end
  end
end
