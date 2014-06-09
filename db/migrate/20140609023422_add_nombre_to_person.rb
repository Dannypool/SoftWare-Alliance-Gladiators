class AddNombreToPerson < ActiveRecord::Migration
  def change
    add_column :people, :nombre, :string
  end
end
