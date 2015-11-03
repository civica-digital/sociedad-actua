module Search
  class ProjectsController < ApplicationController
    def index
      if params[:q]
        @projects = Project.multisearch(params[:q])
      else
        @projects = Project.all
      end
    end
  end
end
