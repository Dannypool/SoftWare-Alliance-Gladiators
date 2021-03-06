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
end
