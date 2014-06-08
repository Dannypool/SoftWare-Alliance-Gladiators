class SchoolTypesController < ApplicationController
  respond_to :json
  def index
    respond_with SchoolType.all
  end

  def show
    respond_with SchoolType.find(params[:id])
  end

  def create
    respond_with SchoolType.create(params[:school_type])
  end

  def update
    respond_with SchoolType(params[:id], params[:school_type])
  end

  def destroy
    respond_with SchoolType.destroy(params[:id])
  end
end
