class CreateLocalities < ActiveRecord::Migration
  def change
    create_table :localities do |t|
      t.string :localidad
      t.integer :municipality_id

      t.timestamps
    end
  end
end
