class RoleStatus < ActiveRecord::Base
  attr_accessible :fecha_fin, :fecha_inicio, :person_id, :role_id, :status_id
end
