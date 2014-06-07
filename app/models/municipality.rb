class Municipality < ActiveRecord::Base
  attr_accessible :municipio, :state_id
  belongs_to :state
  has_many :localities
  has_many :trainning_courses
end
