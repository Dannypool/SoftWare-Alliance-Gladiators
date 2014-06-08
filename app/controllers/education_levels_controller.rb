class EducationLevelsController < ApplicationController
  respond_to :json
  def index

    respond_with EducationalLevel.all
  end

  def show
    respond_with EducationalLevel.find(params[:id])
  end

  def create
    respond_with EducationalLevel.create(params[:educational_level])
  end

  def update
    respond_with EducationalLevel.update(params[:id], params[:educational_level])

  end

  def destroy
    respond_with EducationalLevel.destroy(params[:id])
  end
end
