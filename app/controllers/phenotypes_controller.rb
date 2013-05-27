class PhenotypesController < ApplicationController
  # GET /phenotypes
  # GET /phenotypes.json
  def index
    @phenotypes = Phenotype.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @phenotypes }
    end
  end

  # GET /phenotypes/1
  # GET /phenotypes/1.json
  def show
    @phenotype = Phenotype.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @phenotype }
    end
  end

  # GET /phenotypes/new
  # GET /phenotypes/new.json
  def new
    @phenotype = Phenotype.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @phenotype }
    end
  end

  # GET /phenotypes/1/edit
  def edit
    @phenotype = Phenotype.find(params[:id])
  end

  # POST /phenotypes
  # POST /phenotypes.json
  def create
    @phenotype = Phenotype.new(params[:phenotype])

    respond_to do |format|
      if @phenotype.save
        format.html { redirect_to @phenotype, notice: 'Phenotype was successfully created.' }
        format.json { render json: @phenotype, status: :created, location: @phenotype }
      else
        format.html { render action: "new" }
        format.json { render json: @phenotype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /phenotypes/1
  # PUT /phenotypes/1.json
  def update
    @phenotype = Phenotype.find(params[:id])

    respond_to do |format|
      if @phenotype.update_attributes(params[:phenotype])
        format.html { redirect_to @phenotype, notice: 'Phenotype was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @phenotype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /phenotypes/1
  # DELETE /phenotypes/1.json
  def destroy
    @phenotype = Phenotype.find(params[:id])
    @phenotype.destroy

    respond_to do |format|
      format.html { redirect_to phenotypes_url }
      format.json { head :no_content }
    end
  end
end
