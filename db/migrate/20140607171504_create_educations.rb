class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.integer :person_id
      t.integer :school_type_id
      t.string :nombre

      t.timestamps
    end
  end
end
