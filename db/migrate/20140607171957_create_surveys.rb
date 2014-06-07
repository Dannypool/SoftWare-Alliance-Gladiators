class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.integer :person_id
      t.integer :salud
      t.string :descripcion_salud
      t.integer :enfermedad
      t.integer :colaborador
      t.string :funcion
      t.integer :familiares
      t.date :termino_estudios
      t.integer :deuda_materia
      t.string :materia
      t.string :enterado
      t.integer :especificacion_enterado
      t.integer :nivel_servicio

      t.timestamps
    end
  end
end
