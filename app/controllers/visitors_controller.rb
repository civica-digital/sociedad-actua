class VisitorsController < ApplicationController
  def tos
  end

  def privacy
  end

  def about
  end

  def index
  	@projects = Project.all
    @projetc =  Project.new
    @array_lat=[]
    @array_lng=[]
    @array_name=[]
  	@projects.each_with_index do |project, index|
    	@array_lat[index] = project.lat
    	@array_lng[index] = project.lng
      @array_name[index] = project.name
  	end
  end
end
