class RoleStatusesController < ApplicationController
  respond_to :json
  def index
  end

  def create

    @alloc = RoleStatus.new(params[:id])
    respond_to do |format|
      if @alloc.save
        format.html { redirect_to notice: 'Exito' }

      else
        format.json { render json: @alloc.errors, status: :unprocessable_entity }
      end
    end

    #respond_with RoleStatus.create(params[:role_statuses])
  end

  def show
  end

  def destroy
  end

  def update
    respond_with RoleStatus.update(params[:id],params[:role_status])
  end
end
