class OrganizationsController < ApplicationController
  before_action :set_organization, only: [:show, :edit, :update, :destroy]

  def index
   @organizations = Organization.all
  end

  def show
  end

  def edit
  end

  def new
    if current_user.profile.nil?
      @organization = Organization.new
    else
      redirect_to root_path
      flash[:notice] = I18n.t('organization.notices.profile_already_exists')
    end
  end

  def create
    @organization = Organization.new(organization_params)
    @organization.user = current_user

    if @organization.save
      flash[:notice] = I18n.t('organization.notices.saved')
      redirect_to @organization
    else
      render 'new'
    end
  end

    def update
    respond_to do |format|
      if @organization.update(organization_params)
        format.html { redirect_to @organization, notice: I18n.t('organization.notices.updated') }
        format.json { render :show, status: :ok, location: @organization }
      else
        format.html { render :edit }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def organization_params
    params.require(:organization).permit(:name, :type_organization, :rfc,
                                         :mision, :address, :colonia, :town,
                                         :zip, :telephone, :email, :site, :facebook,
                                         :twitter, :youtube, :instagram, :blog,
                                         :show_address, :show_town, :show_colonia,
                                         :has_funding_private,:has_funding_public,:has_funding_auto,:has_funding_national,
                                         :has_funding_international,:rate_private,:rate_national,:rate_international,
                                         :show_telephone, :show_zip, :show_email, :logo,causes_interest: [])

  end
  
  def set_organization
    @organization = Organization.find(params[:id])
  end
end
