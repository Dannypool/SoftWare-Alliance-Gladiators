class CreateMoments < ActiveRecord::Migration
  def change
    create_table :moments do |t|
      t.integer :momento
      t.integer :momento
      t.integer :year
      t.date :fecha
      t.integer :descripcion

      t.timestamps
    end
  end
end
