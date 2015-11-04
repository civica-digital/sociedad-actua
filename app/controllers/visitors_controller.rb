class VisitorsController < ApplicationController
require 'open-uri'

before_action :set_values_map
before_action :skip_authorization


  def tos
  end

  def privacy
  end

  def about
  end

  def index
    
  	@projects = Project.order(:name)
    if params[:tag]
      if !params[:tag][:distrito].blank? || !params[:tag][:seccion].blank? || !params[:tag][:ageb].blank? || !params[:tag][:city].blank?
        search_information(params)
      else
        load_markers
      end
    else
      load_markers
    end
  end

    def download_csv_project
      respond_to do |format|
        @projects = Project.order(:name)
        format.csv
      end
  end


  private
  def set_values_map
    @projetc =  Project.new
    clean_arrays
    
  end

  def search_information(params)

    if !params[:tag][:city].blank?
      get_town_information(params)
    end

    if !params[:tag][:distrito].blank? || !params[:tag][:seccion].blank? 
      get_electoral_information(params)
    end

    if !params[:tag][:ageb].blank?
        get_ageb_information(params)
    end
  end


  def get_town_information(params)
    clean_arrays
    @projects.each_with_index do |project, index|
      if project.town.to_s == params[:tag][:city].to_s
        unless project.lat.nil?
          @array_lat[index] = project.lat
          @array_lng[index] = project.lng
          @array_name[index] = project.name
          @array_id[index] = project.id
        end
      end
    end
    @projects = Project.where(id: @array_id).order(:name)
  end

  def get_ageb_information(params)
    clean_arrays
    @projects.each_with_index do |project, index|
      response = open("https://jpel.cartodb.com/api/v2/sql?q=SELECT cvegeo FROM nl_ageb_urb WHERE ST_Within(ST_GeomFromText('POINT(#{project.lng} #{project.lat})', 4326), the_geom)").read
      parsed = JSON.parse(response)
      if parsed["total_rows"].to_i > 0
        if parsed["rows"][0]["cvegeo"].to_s == params[:tag][:ageb].to_s
          unless project.lat.nil?
            @array_lat[index] = project.lat
            @array_lng[index] = project.lng
            @array_name[index] = project.name
            @array_id[index] = project.id
          end
        end
      end
    end
      @projects = Project.where(id: @array_id).order(:name)
  end



  def get_electoral_information(params)
    clean_arrays
    @projects.each_with_index do |project, index|
        response = open("https://cicadmin.cartodb.com:443/api/v2/sql?q=select municipio, distrito, seccion from public.nl_secciones_electorales where ST_Within(ST_GeomFromText('POINT(#{project.lng} #{project.lat})', 4326), the_geom)").read
        parsed = JSON.parse(response)
        if parsed["total_rows"].to_i > 0
          if parsed["distrito"].to_s == params[:tag][:distrito].to_s || params[:tag][:seccion].to_s == parsed["seccion"].to_s
            unless project.lat.nil?
              @array_lat[index] = project.lat
              @array_lng[index] = project.lng
              @array_name[index] = project.name
              @array_id[index] = project.id
            end
          end
        end
      end
      @projects = Project.where(id: @array_id).order(:name)
  end

  def load_markers
    @projects.each_with_index do |project, index|
      unless project.lat.nil?
          @array_lat[index] = project.lat
          @array_lng[index] = project.lng
          @array_name[index] = project.name
          @array_id[index] = project.id
      end
    end
  end

  def clean_arrays
    @array_lat=[]
    @array_lng=[]
    @array_name=[]
    @array_id=[]
  end

end
