class ExpedienteController < ApplicationController
  def index
  end

  def show
  end

  def create
  end

  def update
  end

  def show_people_from_id

    sql = "select * from people
where id="+ params[:id]


    @objeto_pg = ActiveRecord::Base.connection.execute(sql)
    render :json => @objeto_pg

  end
end
