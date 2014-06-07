class Survey < ActiveRecord::Base
  attr_accessible :colaborador, :descripcion_salud, :deuda_materia, :enfermedad, :enterado, :especificacion_enterado, :familiares, :funcion, :materia, :nivel_servicio, :person_id, :salud, :termino_estudios
end
