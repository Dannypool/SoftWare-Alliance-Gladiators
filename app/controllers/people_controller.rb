class PeopleController < ApplicationController
  respond_to :json
  def index
    respond_with Person.all
  end

  def show
    respond_with Person.find(params[:id])
  end

  def show_people_from_state
    #@data = People.where("state_id = ?", params[:id]).select([:id, :municipio, :state_id])

    sql = "select p.id, p.nombre, p.a_paterno, lc.localidad, mp.municipio, st.estado, lan.nombre from people as p inner join addresses as ad on p.id = ad.person_id
inner join localities as lc on lc.id = ad.locality_id
inner join municipalities as mp on mp.id = lc.municipality_id
inner join states as st on st.id = mp.state_id
inner join languages as lan on  lan.id = p.language_id
left join allocated_figures as af on af.person_id = p.id
inner join role_statuses as rs on rs.person_id = p.id
where st.id = "+ params[:estado] + " and lan.id= "+ params[:lengua] + "  and af.id is null and (rs.status_id = 1 or rs.status_id = 3) and (rs.role_id = 2 or rs.role_id = 3)"


    @objeto_pg = ActiveRecord::Base.connection.execute(sql)
    render :json => @objeto_pg

  end

  def create

    @persona = Person.new()
    @persona.addresses.build
    @persona.save((params[:person]))

    respond_with @persona
  end

  def update
    respond_with Person.update(params[:id],params[:person])
  end

  def destroy
    respond_with Person.destroy(params[:id])
  end
end
