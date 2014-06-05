class CourseStatusesController < ApplicationController
  respond_to :json

  def index
    respond_with CourseStatus.all
  end

  def show
    respond_with CourseStatus.find(params[:id])
  end

  def create
    respond_with CourseStatus.create(params[:curso])
  end

  def update
    respond_with CourseStatus.update(params[:id],params[:curso])
  end

  def destroy
    respond_with CourseStatus.destroy(params[:id])
  end
end
