class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :venue_id
      t.integer :venue_locality_id
      t.integer :education_type_id
      t.integer :language_id
      t.integer :necesidad

      t.timestamps
    end
  end
end
