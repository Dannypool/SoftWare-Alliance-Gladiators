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

end

=begin



  # GET /items/1
  # GET /items/1.json


  # GET /items/new
  # GET /items/new.json
  def new
    @item = Item.new
    #@house.rooms.build
    @item.statistics.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @item }
    end
  end

  # GET /items/1/edit
  def edit
    @item = Item.find(params[:id])
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(params[:item])

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render json: @item, status: :created, location: @item }
      else
        format.html { render action: "new" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /items/1
  # PUT /items/1.json
  def update
    @item = Item.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to items_url }
      format.json { head :no_content }
    end
  end

=end
