class VisitorsController < ApplicationController
before_action :set_values_map

  def tos
  end

  def privacy
  end

  def about
  end

  def index
    
  	@projects = Project.order(:name)
    @projects.each_with_index do |project, index|
      @array_lat[index] = project.lat
      @array_lng[index] = project.lng
      @array_name[index] = project.name
    #get_electoral_information(@array_lat[index],@array_lng[index])
      get_electoral_information("-100.30860900878906", "25.686706571891094")
    end
    
  end


  private
  def set_values_map
    @projetc =  Project.new
    @array_lat=[]
    @array_lng=[]
    @array_name=[]
    
  end

  def get_electoral_information(lat,lng)
    require 'open-uri'
    response = open("https://cicadmin.cartodb.com:443/api/v2/sql?q=select municipio, distrito, seccion from public.nl_secciones_electorales where ST_Within(ST_GeomFromText('POINT(#{lat} #{lng})', 4326), the_geom)").read
    parsed = JSON.parse(response)
    puts parsed["total_rows"]
    if parsed["total_rows"].to_i > 0
      parsed["rows"].each do |row|
        puts row["municipio"]
        puts row["distrito"]
        puts row["seccion"]
      end
    end
   

  end
end
