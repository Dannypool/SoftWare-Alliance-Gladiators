class AllocatedFiguresController < ApplicationController
  def index

    @alloc = AllocatedFigure.all

  end

  def new

    @alloc = AllocatedFigure.new

  end

  def show
    @alloc = AllocatedFigure.find(params[:id])
  end

  def create

    respond_with AllocatedFigure.create(params[:educational_level])
    #@alloc = AllocatedFigure.new(params[:id])

    #respond_to do |format|
    #if @alloc.save
    #format.html { redirect_to @alloc, notice: 'Exito' }
    #format.json { render json: @alloc, status: :created, location: @alloc }
    #else
    #format.json { render json: @alloc.errors, status: :unprocessable_entity }
    #end
    #end

  end

  def update

    @alloc = AllocatedFigure.find(params[:id])

    respond_to do |format|
      if @alloc.update_attributes(params[:activity])
        format.html { redirect_to @alloc, notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      else

        format.json { render json: @alloc.errors, status: :unprocessable_entity }
      end
    end

  end

  def destroy

    @alloc = Activity.find(params[:id])
    @alloc.destroy

    respond_to do |format|
      format.html { redirect_to items_url }
      format.json { head :no_content }
    end

  end
end
