class MunicipalitiesController < ApplicationController
  respond_to :json

  def index
    respond_with Municipality.all
    #@data = Municipality.all
    #render :json => {:municipio => @data}
  end

  def show_many_localities

    #respond_with Municipality.where("id = ?", params[:id])
    @data = Municipality.where("state_id = ?", params[:id]).select([:id, :municipio, :state_id])
    render :json => {:municipio => @data}

  end


  def show
    respond_with Municipality.find(params[:id])
  end

  def create
    respond_with Municipality.create(params[:curso])
  end

  def update
    respond_with Municipality.update(params[:id],params[:curso])
  end

  def destroy
    respond_with Municipio.destroy(params[:id])
  end
end
