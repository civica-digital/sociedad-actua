class ProyectsController < ApplicationController
  before_action :set_proyect, only: [:show, :edit, :update, :destroy]


  def index
    @proyects = Proyect.all
  end


  def show
  end


  def new
    @proyect = Proyect.new
  end


  def edit
  end


  def create
    @proyect = Proyect.new(proyect_params)

    respond_to do |format|
      if @proyect.save
        format.html { redirect_to @proyect, notice: 'Proyect was successfully created.' }
        format.json { render :show, status: :created, location: @proyect }
      else
        format.html { render :new }
        format.json { render json: @proyect.errors, status: :unprocessable_entity }
      end
    end
  end

on
  def update
    respond_to do |format|
      if @proyect.update(proyect_params)
        format.html { redirect_to @proyect, notice: 'Proyect was successfully updated.' }
        format.json { render :show, status: :ok, location: @proyect }
      else
        format.html { render :edit }
        format.json { render json: @proyect.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @proyect.destroy
    respond_to do |format|
      format.html { redirect_to proyects_url, notice: 'Proyect was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_proyect
      @proyect = Proyect.find(params[:id])
    end

    def proyect_params
      params[:proyect]
    end
end
