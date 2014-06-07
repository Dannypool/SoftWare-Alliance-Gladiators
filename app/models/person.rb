class Person < ActiveRecord::Base
  attr_accessible :a_materno, :a_paterno, :calzado, :curp, :fecha_nac, :language_id, :lugar_nac, :nombre, :rfc, :sexo, :talla_pants, :talla_playera, :telefono, :tipo_sangre, :tipo_zona
end
