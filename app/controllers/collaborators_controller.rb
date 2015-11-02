class CollaboratorsController < ApplicationController
  before_action :collaborator_params, only: :create
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_collaborator, only: [:show, :edit, :update, :destroy]

  def index
    @collaborators = Collaborator.all
  end

  def show
    authorize @collaborator
  end

  def edit
    authorize @collaborator
  end

  def update
    authorize @collaborator

    respond_to do |format|
      if @collaborator.update(collaborator_params)
        format.html { redirect_to @collaborator, notice: I18n.t('collaborator.notices.updated') }
        format.json { render :show, status: :ok, location: @collaborator }
      else
        format.html { render :edit }
        format.json { render json: @collaborator.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def collaborator_params
    params.require(:collaborator).permit(:name, :email, :type_collaborator, :description,
                                         :site_url, :facebook_url, :instagram_url,
                                         :twitter_url, :youtube_url, :blog_url, :logo, causes_interest: [])
  end

  def set_collaborator
    @collaborator = Collaborator.find(params[:id])
  end
end
