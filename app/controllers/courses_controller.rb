class CoursesController < ApplicationController
  respond_to :json
  def index
    respond_with Course.all
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

end
