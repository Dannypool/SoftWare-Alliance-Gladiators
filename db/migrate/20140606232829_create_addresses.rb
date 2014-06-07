class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :calle
      t.integer :numero
      t.string :colonia
      t.date :fecha_de_actualizacion
      t.integer :locality_id
      t.integer :person_id

      t.timestamps
    end
  end
end
