class AddTipoEnfermedadToSurvey < ActiveRecord::Migration
  def change
    add_column :surveys, :tipo_enfermedad, :string
  end
end
