class CreateAllocatedFigures < ActiveRecord::Migration
  def change
    create_table :allocated_figures do |t|
      t.integer :activity_id
      t.integer :person_id
      t.date :fecha_inicio
      t.date :fecha_fin
      t.integer :status

      t.timestamps
    end
  end
end
