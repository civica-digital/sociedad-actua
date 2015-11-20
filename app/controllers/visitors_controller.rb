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
     @projects.each do |project|
        if (project.lat == nil)
             geocoder_results=Geocoder.search(project.direction)
             geocoder_results.each do |result|
               project.lat=result.geometry["location"]["lat"]
               project.lng=result.geometry["location"]["lng"]
               project.save
             end
            
        end
    end
    if params[:tag]
      if !params[:tag][:distrito].blank? || !params[:tag][:seccion].blank? || !params[:tag][:ageb].blank? || !params[:tag][:city].blank?
        search_information(params)
      else
        load_markers
      end
    else
      load_markers
    end
    # the showcase only needs 6 elements
    @organizations ||= Organization.with_logo.take(4)
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
    @markers =@projects.select { |elem| elem.lat.present? && elem.town.to_s  == params[:tag][:city].to_s }.map{ |project| {lat: project.lat , lng: project.lng , name: project.name , id: project.id , url: organization_project_path(project.organization, project.id) , status: project.status }}
    @projects = Project.where(id:  @markers.collect {|i| i[:id] }).order(:name)
  end
   
  def get_ageb_information(params)
    @markers =@projects.select { |elem| elem.lat.present? && get_projects_from_ageb(elem) }.map{ |project| {lat: project.lat , lng: project.lng , name: project.name , id: project.id , url: organization_project_path(project.organization, project.id) , status: project.status }}
    @projects = Project.where(id:  @markers.collect {|i| i[:id] }).order(:name)
  end

  def get_projects_from_ageb(element)
    result =false;
    response = open("https://jpel.cartodb.com/api/v2/sql?q=SELECT cvegeo FROM nl_ageb_urb WHERE ST_Within(ST_GeomFromText('POINT(#{element.lng} #{element.lat})', 4326), the_geom)").read
    parsed = JSON.parse(response)

    if parsed["total_rows"].to_i > 0
      if parsed["rows"][0]["cvegeo"].to_s == params[:tag][:ageb].to_s
        result= true;
      end
    end
    return result;
  end

  def get_electoral_information(params)
    @markers =@projects.select { |elem| elem.lat.present? && get_projects_from_electoral_information(elem) }.map{ |project| {lat: project.lat , lng: project.lng , name: project.name , id: project.id , url: organization_project_path(project.organization, project.id) , status: project.status }}
    @projects = Project.where(id:  @markers.collect {|i| i[:id] }).order(:name) 
  end

  def get_projects_from_electoral_information(element)
    result =false;
    response = open("https://cicadmin.cartodb.com:443/api/v2/sql?q=select municipio, distrito, seccion from public.nl_secciones_electorales where ST_Within(ST_GeomFromText('POINT(#{element.lng} #{element.lat})', 4326), the_geom)").read
    parsed = JSON.parse(response)
    if parsed["total_rows"].to_i > 0
      if parsed["rows"][0]["distrito"].to_s == params[:tag][:distrito].to_s || params[:tag][:seccion].to_s == parsed["rows"][0]["seccion"].to_s
        result= true;
      end
    end
    return result;
  end

  def load_markers
    @markers =@projects.select { |elem| elem.lat.present? }.map{ |project| {lat: project.lat , lng: project.lng , name: project.name , id: project.id , url: organization_project_path(project.organization, project.id) , status: project.status }}
  end

   

end
