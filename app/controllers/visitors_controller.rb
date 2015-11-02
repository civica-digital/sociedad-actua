class VisitorsController < ApplicationController
  def tos
  end

  def privacy
  end

  def about
  end

  def index
  	@projects = Project.all
	@hash = Gmaps4rails.build_markers(@projects) do |project, marker|
  		marker.lat project.latitude
  		marker.lng project.longitude
	end
  end
end
