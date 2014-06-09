class RemoveNombreFromPerson < ActiveRecord::Migration
  def up
    remove_column :people, :nombre
  end

  def down
    add_column :people, :nombre, :integer
  end
end
