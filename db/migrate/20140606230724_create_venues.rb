class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.integer :locality_id
      t.string :localizacion

      t.timestamps
    end
  end
end
