class AdultsController < ApplicationController
  before_filter :authenticate_user!
  # GET /adults
  # GET /adults.json
  def index
    @adults = Adult.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @adults }
    end
  end

  # GET /adults/1
  # GET /adults/1.json
  def show
    @adult = Adult.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @adult }
    end
  end

  # GET /adults/new
  # GET /adults/new.json
  def new
    @adult = Adult.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @adult }
    end
  end

  # GET /adults/1/edit
  def edit
    @adult = Adult.find(params[:id])
  end

  # POST /adults
  # POST /adults.json
  def create
    @adult = Adult.new(params[:adult])

    respond_to do |format|
      if @adult.save
        format.html { redirect_to @adult, notice: 'Adult was successfully created.' }
        format.json { render json: @adult, status: :created, location: @adult }
      else
        format.html { render action: "new" }
        format.json { render json: @adult.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /adults/1
  # PUT /adults/1.json
  def update
    @adult = Adult.find(params[:id])

    respond_to do |format|
      if @adult.update_attributes(params[:adult])
        format.html { redirect_to @adult, notice: 'Adult was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @adult.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /adults/1
  # DELETE /adults/1.json
  def destroy
    @adult = Adult.find(params[:id])
    @adult.destroy

    respond_to do |format|
      format.html { redirect_to adults_url }
      format.json { head :no_content }
    end
  end
end
