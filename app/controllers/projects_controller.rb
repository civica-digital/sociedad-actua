class ProjectsController < ApplicationController
  include ProjectsHelper

  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @organization = Organization.find(params[:organization_id])
  end

  def show
    authorize @project
    @collaborators = @project.collaborators.map { |id| Organization.find(id) }
    render :layout => "profiles"
  end

  def new
    @organization = Organization.find(params[:organization_id])
    @project = @organization.projects.new
    @collaborator = Organization.all
    authorize @project
  end

  def edit
    authorize @project
    @organization = Organization.find(params[:organization_id])
    @collaborator = Organization.all
  end

  def create
    @project = Project.new(project_params)
    @project.organization = current_user.profile # TO-DO: Refactor this
    authorize @project

    respond_to do |format|
      if @project.save
        format.html { redirect_to organization_projects_path(@project.organization), notice: I18n.t('project.notices.successfully_created') }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    authorize @project

    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to organization_projects_path(@project.organization), notice: I18n.t('project.notices.successfully_updated') }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def list
    skip_authorization
    if params[:q]
      projects = Project.multisearch(params[:q])
      causes = retrive_projects_with CAUSE.search(params[:q]).ids

      @projects = causes.push(*projects).uniq
    else
      @projects = Project.all
    end
  end

  def causes
    skip_authorization
  end

  private
    def set_project
      @project = Project.find(params[:id])
    end

   def project_params
    params.require(:project).permit(:name, :goals, :description, :status, :photo_project,:town,
                                     :direction, :comments_from_direction, :name_of_owner,
                                     :email, :phone, :website, :twitter, :facebook, :organization_id,
                                     :lat, :lng, :other_causes, causes_interest: [], clasification: [], collaborators: [])
   end
end
