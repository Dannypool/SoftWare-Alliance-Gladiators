class AddTipoToSchoolType < ActiveRecord::Migration
  def change
    add_column :school_types, :tipo, :string
  end
end
