class TrainingFiguresController < ApplicationController
  def index
  end

  def create
    @Trainig = TrainingFigure.new(params[:training_figure])
    respond_to do |format|
      if @Trainig.save
        format.html { redirect_to notice: 'Exito' }

      else
        format.json { render json: @alloc.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
  end

  def destroy
  end
end
