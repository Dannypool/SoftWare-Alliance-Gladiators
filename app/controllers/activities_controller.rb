class ActivitiesController < ApplicationController
  def index

    @activities = Activity.all

    respond_to do |format|
      format.html # index.html.erb.erb.erb
      format.json { render json: @activities}
    end

  end

  def show

    @activities = Activity.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @activities }
    end

  end

  def create

    @act = Activity.new(params[:item])

    respond_to do |format|
      if @act.save
        format.html { redirect_to @act, notice: 'Item was successfully created.' }
        format.json { render json: @act, status: :created, location: @act }
      else
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end

  end

  def update

    @item = Activity.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      else

        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end


  end

  def destroy

    @item = Activity.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to items_url }
      format.json { head :no_content }
    end


  end

  def new
    @itm = Activity.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @itm }
    end
  end


  def consulta_actividades

    #Aqui espero el id de localidad

    sql = "select loc.localidad, v.localizacion, a.id, l.nombre, a.necesidad from localities as loc
    inner join venues as v on v.locality_id =" + params[:id] +
    "inner join activities as a on a.venue_id = v.id
    inner join languages as l on a.language_id = l.id"

    @actividad_pg = ActiveRecord::Base.connection.execute(sql)
    render :json =>  @objeto_pg

  end

end


