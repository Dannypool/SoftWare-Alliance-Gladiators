class Person < ActiveRecord::Base
  attr_accessible :a_materno, :a_paterno, :calzado, :curp, :fecha_nac, :language_id, :lugar_nac, :nombre, :rfc, :sexo, :talla_pants, :talla_playera, :telefono, :tipo_sangre, :tipo_zona
  has_many :addresses
  has_many :allocated_figures
  has_many :role_statuses
  has_many :educations
  has_many :activities, :through => :allocated_figures
  belongs_to :language
  has_one :survey


  accepts_nested_attributes_for :addresses
  accepts_nested_attributes_for :allocated_figures
  accepts_nested_attributes_for :role_statuses
  accepts_nested_attributes_for :educations


end
