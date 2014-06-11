class TrainingCoursesController < ApplicationController
  respond_to :json

  def index
  respond_with TrainningCourse.all
  end

  def show
    respond_with TrainningCourse.find(params[:id])
  end

  def create
    respond_with TrainningCourse.create(params[:training_course])
  end

  def update
    respond_with TrainningCourse.update(params[:id],params[:training_course])
  end

  def destroy
    respond_with TrainningCourse.destroy(params[:id])
  end

  def consulta_cursos_formacion

    sql = "select co.nombre, et.nombre, lg.nombre, tc.fecha_inicio, tc.fecha_fin from courses as co join trainning_courses as tc on co.id = tc.course_id
              join education_types as et on tc.education_type_id = et.id
              join languages as lg on lg.id = tc.language_id where tc.course_status_id = 1 and tc.municipality_id = " + params[:id]

    @objeto_pg1 = ActiveRecord::Base.connection.execute(sql)
    respond_with (@objeto_pg1)


  end

end
