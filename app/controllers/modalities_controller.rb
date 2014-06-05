class ModalitiesController < ApplicationController
  respond_to :json

  def index
    respond_with Modality.all
  end

  def show
    respond_with Modality.find(params[:id])
  end

  def create
    respond_with Modality.create(params[:curso])
  end

  def update
    respond_with Modality.update(params[:id],params[:curso])
  end

  def destroy
    respond_with Modality.destroy(params[:id])
  end
end
