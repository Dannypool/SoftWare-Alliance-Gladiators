class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.integer :language_id
      t.integer :nombre
      t.string :a_paterno
      t.string :a_materno
      t.date :fecha_nac
      t.integer :sexo
      t.integer :tipo_sangre
      t.string :curp
      t.string :rfc
      t.string :lugar_nac
      t.integer :tipo_zona
      t.integer :calzado
      t.integer :talla_playera
      t.integer :talla_pants
      t.string :telefono

      t.timestamps
    end
  end
end
