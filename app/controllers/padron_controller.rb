class PadronController < ApplicationController
  respond_to :json

    def index

      @padron = Person.all

    end


    def show_people_from_padron
      #@data = People.where("state_id = ?", params[:id]).select([:id, :municipio, :state_id])
      sql = "select p.id, p.nombre, p.a_paterno, lc.localidad, mp.municipio, st.estado from people as p inner join addresses as ad on p.id = ad.person_id
          inner join localities as lc on lc.id = ad.locality_id inner join municipalities as mp on mp.id = lc.municipality_id
          inner join states as st on st.id = mp.state_id"

      @objeto_pg = ActiveRecord::Base.connection.execute(sql)
      render :json => {:objeto1 => @objeto_pg, :objeto2 => @objeto_pg}



    end



end
