class RoleStatus < ActiveRecord::Base
  attr_accessible :fecha_fin, :fecha_inicio, :person_id, :role_id, :status_id
  belongs_to :person
  belongs_to :status
  belongs_to :role
end
