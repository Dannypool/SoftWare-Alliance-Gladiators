class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
