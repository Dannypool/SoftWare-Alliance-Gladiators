class RemoveStatusFromCourse < ActiveRecord::Migration
  def up
    remove_column :courses, :status
  end

  def down
    add_column :courses, :status, :string
  end
end
