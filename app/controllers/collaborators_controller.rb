class CollaboratorsController < ApplicationController
  before_action :collaborator_params, only: :create
  before_action :authenticate_user!, :except => [:show, :index]

  def show
    @collaborator = Collaborator.find(params[:id])
  end

  def create
    @collaborator = Collaborator.new(collaborator_params)
    @collaborator.user = current_user
    if @collaborator.save and current_user.profile.nil?
      flash[:notice] = "Tu información ha sido registrada. ¡Sociedad Actúa será presentado el próximo 4 de noviembre!"
      redirect_to @collaborator
    else
      render 'new'
    end
  end

  def new
    if current_user.profile.nil?
      @collaborator = Collaborator.new
    else
      redirect_to root_path
      flash[:notice] = "Ya tienes un perfil asociado."
    end

  end

  private
  def collaborator_params
    params.require(:collaborator).permit(:name, :email, :type_collaborator, :description,
                                         :site_url, :facebook_url, :instagram_url,
                                         :twitter_url, :youtube_url, :blog_url, :logo)
  end

end
