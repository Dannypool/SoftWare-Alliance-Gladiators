class Document < ActiveRecord::Base
  attr_accessible :fecha_creacion, :nombre, :repository_id
end
