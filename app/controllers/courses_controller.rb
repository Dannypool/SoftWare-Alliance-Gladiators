class CoursesController < ApplicationController
  respond_to :json, :html
  def index
    @cr = Course.all
    respond_with (@cr)
  end

  def show
    respond_with Course.find(params[:id])
  end

  def show_habilitados
    respond_with Course.cursos_habilitados
  end

  def create
    respond_with Course.create(params[:course])
  end

  def update
    respond_with Course.update(params[:id],params[:course])
  end

  def destroy
    respond_with CourseStatus.destroy(params[:id])
  end

  def show_courses_by_municipality

    sql = "select cr.id, cr.description, cr.status, mn.municipio, ed.nombre as educacion, lan.nombre as lengua , lan.id  as lengua_id from courses as cr
          inner join trainning_courses as tc on tc.course_id = cr.id
          inner join education_types as ed on ed.id = tc.education_type_id
          inner join languages as lan on  lan.id = tc.language_id
          inner join municipalities as mn on tc.municipality_id = mn.id where mn.id = " + params[:id]

    @courses_by_municipality_pg = ActiveRecord::Base.connection.execute(sql)
    render :json =>  @courses_by_municipality_pg

  end


end
