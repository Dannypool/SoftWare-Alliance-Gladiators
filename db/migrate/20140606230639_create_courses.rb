class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :description
      t.string :nombre
      t.string :status

      t.timestamps
    end
  end
end
