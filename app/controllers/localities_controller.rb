class LocalitiesController < ApplicationController
  respond_to :json

  def index
    respond_with Locality.all
  end

  def show
    respond_with Locality.find(params[:id])
  end

  def show_many_municipalities

    #respond_with Municipality.where("id = ?", params[:id])
    @data = Locality.where("municipality_id = ?", params[:id]).select([:id, :localidad])
    render :json => {:localities => @data}

  end

  def create
    respond_with Locality.create(params[:curso])
  end

  def update
    respond_with Locality.update(params[:id],params[:curso])
  end

  def destroy
    respond_with Locality.destroy(params[:id])
  end
end
