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

    sql = "select loc.localidad, v.localizacion, a.id, l.nombre, et.nombre from localities as loc
inner join venues as v on v.locality_id = loc.id
inner join activities as a on a.venue_id = v.id
inner join education_types as et on a.education_type_id = et.id
inner join languages as l on a.language_id = l.id where loc.id =" + params[:id]

    @actividad_pg = ActiveRecord::Base.connection.execute(sql)
    render :json =>  @actividad_pg

  end

  def consulta_una_actividad

    #Aqui espero el id de localidad

    sql = "select et.nombre as educacion, l.nombre as lengua, a.id , a.necesidad, l.id as lengua_id from activities as a
            inner join languages as l on a.language_id = l.id
            inner join education_types as et on a.education_type_id = et.id
            where a.id = " + params[:id]

    @actividad_sola_pg = ActiveRecord::Base.connection.execute(sql)
    render :json =>  @actividad_sola_pg

  end




end


