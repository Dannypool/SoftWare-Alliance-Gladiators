class CreateEducationalLevels < ActiveRecord::Migration
  def change
    create_table :educational_levels do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
