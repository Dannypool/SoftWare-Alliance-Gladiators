class CourseStatus < ActiveRecord::Base
  attr_accessible :descripcion, :estado, :habilitado
  has_many :trainning_courses


  def self.cursos_habilitados()
    @cursos_habilitados = self.where("habilitado = '1'")
    return @cursos_habilitados
  end

end
