class MunicipalitiesController < ApplicationController
  respond_to :json

  def index
    respond_with Municipality.all
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
