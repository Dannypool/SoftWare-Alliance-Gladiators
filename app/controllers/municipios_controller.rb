class MunicipiosController < ApplicationController
  respond_to :json

  def index
    respond_with Municipio.all
  end

  def show
    respond_with Municipio.find(params[:id])
  end

  def create
    respond_with Municipio.create(params[:curso])
  end

  def update
    respond_with Municipio.update(params[:id],params[:curso])
  end

  def destroy
    respond_with Municipio.destroy(params[:id])
  end
end
