class StatesController < ApplicationController
  respond_to :json

  def index
    respond_with State.all
    #@data = State.all
    #render :json => {:estado => @data}

  end

  def show
    respond_with State.find(params[:id])
  end

  def create
    respond_with State.create(params[:curso])
  end

  def update
    respond_with State.update(params[:id],params[:curso])
  end

  def destroy
    respond_with Municipio.destroy(params[:id])
  end
end
