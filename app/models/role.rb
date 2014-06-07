class Role < ActiveRecord::Base
  attr_accessible :description

  has_many :role_statuses

end
