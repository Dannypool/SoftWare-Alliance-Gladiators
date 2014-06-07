class CreateRepositories < ActiveRecord::Migration
  def change
    create_table :repositories do |t|
      t.string :ruta
      t.integer :person_id

      t.timestamps
    end
  end
end
