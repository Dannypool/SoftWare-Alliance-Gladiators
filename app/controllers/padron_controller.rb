class PadronController < ApplicationController
  respond_to :html,:json

    def index
      sql1 = "select distinct p.id, p.a_paterno, p.a_materno, p.nombre,p.fecha_nac, p.curp, st.estado,
            mp.municipio, lc.localidad, lg.nombre as lengua,rl.description  from people as p
            inner join addresses as ad on p.id = ad.person_id
            inner join localities as lc on lc.id = ad.locality_id
            inner join municipalities as mp on mp.id = lc.municipality_id
            inner join states as st on st.id = mp.state_id
            inner join languages as lg on lg.id = p.language_id
            inner join role_statuses as rls on rls.person_id = p.id
            inner join roles as rl on rl.id =  rls.role_id
            where rl.id = 3 limit 1"

      sql2 = "select s.estado, m.municipio, l.localidad, lan.nombre from states as s
              inner join municipalities as m on m.state_id = s.id
              inner join localities as l on l.municipality_id = m.id
              inner join venues as v on v.locality_id = l.id
              inner join activities as act on act.venue_id = v.id
              inner join allocated_figures as alc on alc.activity_id = act.id
              inner join languages as lan on act.language_id = lan.id
              where alc.person_id=8"


      @objeto_pg1 = ActiveRecord::Base.connection.execute(sql1)
      #@objeto_pg2 = ActiveRecord::Base.connection.execute(sql2)
      respond_with (@objeto_pg1)
      #respond_with(@objeto_pg1, @objeto_pg2 )
      #render :json => {:objeto1 => @objeto_pg}

    end


    def show_people_from_padron


    end



end
