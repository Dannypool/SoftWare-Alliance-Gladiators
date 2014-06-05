class CreateModalities < ActiveRecord::Migration
  def change
    create_table :modalities do |t|
      t.string :modalidad
      t.string :descripcion

      t.timestamps
    end
  end
end
