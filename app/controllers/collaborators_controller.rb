class CollaboratorsController < ApplicationController
  before_action :collaborator_params, only: :create

  def show
    @collaborator = Collaborator.find(params[:id])
  end

  def create
    @collaborator = Collaborator.new(collaborator_params)
    if @collaborator.save
      flash[:notice] = "Excelente! Bienvenido #{@collaborator.type_collaborator}, este es tu perfil público."
      redirect_to @collaborator
    else
      render 'new'
    end
  end

  def new
    @collaborator = Collaborator.new
  end

  private
  def collaborator_params
    params.require(:collaborator).permit(:name, :email, :type_collaborator, :description,
                                         :site_url, :facebook_url, :instagram_url,
                                         :twitter_url, :youtube_url, :blog_url)
  end

end
