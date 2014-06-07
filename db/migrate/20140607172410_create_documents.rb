class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :nombre
      t.date :fecha_creacion
      t.integer :repository_id

      t.timestamps
    end
  end
end
