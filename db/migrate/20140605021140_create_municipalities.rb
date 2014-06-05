class CreateMunicipalities < ActiveRecord::Migration
  def change
    create_table :municipalities do |t|
      t.string :municipio
      t.integer :state_id

      t.timestamps
    end
  end
end
