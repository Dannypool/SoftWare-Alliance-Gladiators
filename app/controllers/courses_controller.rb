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

    sql = "select cr.id, cr.description, cr.status from courses as cr
        inner join trainning_courses as tc on
        tc.municipality_id = cr.id where cr.id = " + params[:id]

    @courses_by_municipality_pg = ActiveRecord::Base.connection.execute(sql)
    render :json =>  @courses_by_municipality_pg

  end


end
