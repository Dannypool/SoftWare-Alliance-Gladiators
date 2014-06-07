class CoursesController < ApplicationController
  def index
    respond_with Course.all
  end

  def show
    respond_with Course.find(params[:id])
  end

  def create
    respond_with Course.create(params[:curso])
  end

  def update
    respond_with Course.update(params[:id],params[:curso])
  end

  def destroy
    respond_with CourseStatus.destroy(params[:id])
  end
end
