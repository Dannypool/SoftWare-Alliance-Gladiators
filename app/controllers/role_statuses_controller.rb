class RoleStatusesController < ApplicationController
  respond_to :json
  def index
  end

  def create
    respond_with RoleStatus.create(params[:id])
  end

  def show
  end

  def destroy
  end

  def update
    respond_with RoleStatus.update(params[:id],params[:role_status])
  end
end
