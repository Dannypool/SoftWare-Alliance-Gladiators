class Status < ActiveRecord::Base
  attr_accessible :nombre
  has_many :role_statuses

end
