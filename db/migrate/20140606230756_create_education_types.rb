class CreateEducationTypes < ActiveRecord::Migration
  def change
    create_table :education_types do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
