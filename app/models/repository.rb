class Repository < ActiveRecord::Base
  attr_accessible :person_id, :ruta
  belongs_to :person
  has_many :documents

end
