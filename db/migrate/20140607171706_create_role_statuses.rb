class CreateRoleStatuses < ActiveRecord::Migration
  def change
    create_table :role_statuses do |t|
      t.date :fecha_inicio
      t.date :fecha_fin
      t.integer :status_id
      t.integer :role_id
      t.integer :person_id

      t.timestamps
    end
  end
end
