class VisitorsController < ApplicationController
before_action :set_values_map
require 'open-uri'

  def tos
  end

  def privacy
  end

  def about
  end

  def index
    
  	@projects = Project.order(:name)
    if params[:tag]
      if !params[:tag][:distrito].blank? || !params[:tag][:seccion].blank? || !params[:tag][:ageb].blank?
        get_electoral_information(params)
      else
        load_markers
      end
    else
      load_markers
    end

    

  end


  private
  def set_values_map
    @projetc =  Project.new
    @array_lat=[]
    @array_lng=[]
    @array_name=[]
    @array_id=[]
    
  end

  def get_electoral_information(params)
    if !params[:tag][:distrito].blank? || !params[:tag][:seccion].blank? 
      @projects.each_with_index do |project, index|
        response = open("https://cicadmin.cartodb.com:443/api/v2/sql?q=select municipio, distrito, seccion from public.nl_secciones_electorales where ST_Within(ST_GeomFromText('POINT(#{project.lng} #{project.lat})', 4326), the_geom)").read
        parsed = JSON.parse(response)
        if parsed["total_rows"].to_i > 0
          if parsed["distrito"].to_s == params[:tag][:distrito].to_s || params[:tag][:seccion].to_s == parsed["seccion"].to_s
            @array_lat[index] = project.lat
            @array_lng[index] = project.lng
            @array_name[index] = project.name
            @array_id[index] = project.id
          end
        end
      end
      @projects = Project.where(id: @array_id).order(:name)
    end
    if !params[:tag][:ageb].blank?
        get_ageb_information(params)
    end
  end

  def get_ageb_information(params)
    @projects.each_with_index do |project, index|
      response = open("https://jpel.cartodb.com/api/v2/sql?q=SELECT cvegeo FROM nl_ageb_urb WHERE ST_Within(ST_GeomFromText('POINT(#{project.lng} #{project.lat})', 4326), the_geom)").read
      parsed = JSON.parse(response)
      if parsed["total_rows"].to_i > 0
        if parsed["rows"][0]["cvegeo"].to_s == params[:tag][:ageb].to_s
          @array_lat[index] = project.lat
          @array_lng[index] = project.lng
          @array_name[index] = project.name
          @array_id[index] = project.id
        end
      end
    end
      @projects = Project.where(id: @array_id).order(:name)
  end

  def load_markers
    @projects.each_with_index do |project, index|
        @array_lat[index] = project.lat
        @array_lng[index] = project.lng
        @array_name[index] = project.name
      end
  end

end
