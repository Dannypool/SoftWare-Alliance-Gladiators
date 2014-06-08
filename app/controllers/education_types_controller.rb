class EducationTypesController < ApplicationController
  respond_to :json
  def index
    respond_with EducationType.all
  end

  def show
    respond_with EducationType.find(params[:id])
  end

  def create
    #respond_with CourseStatus.create(params[:curso])
    respond_with EducationType.create(params[:education_type])
  end

  def update
    respond_with EducationType.update(params[:id],params[:education_type])
  end

  def destroy
    respond_with EducationType.destroy(params[:id])
  end
end
