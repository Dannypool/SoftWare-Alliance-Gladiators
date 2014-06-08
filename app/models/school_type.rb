class SchoolType < ActiveRecord::Base
  attr_accessible :educational_level_id, :tipo

  belongs_to :educational_level
end
