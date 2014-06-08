class Course < ActiveRecord::Base
  attr_accessible :description, :nombre, :status
  has_many :trainning_courses


  def self.cursos_habilitados
    @cursos_habilitados = self.where("status = '1'")
    return @cursos_habilitados
  end

end
