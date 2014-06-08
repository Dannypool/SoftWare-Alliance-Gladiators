class LanguageController < InheritedResources::Base
  respond_to :json
  def index
  respond_with Language.all
  end

  def show
  respond_with Language.find(params[:id])
  end

  def create
    respond_with Language.create(params[:language])
  end

  def update
  respond_with Language.update(params[:id],params[:language])
  end

  def destroy
  respond_with Language.destroy(params[:id])
  end
end
