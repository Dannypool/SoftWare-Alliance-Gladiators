class CreateSchoolTypes < ActiveRecord::Migration
  def change
    create_table :school_types do |t|
      t.integer :educational_level_id

      t.timestamps
    end
  end
end
