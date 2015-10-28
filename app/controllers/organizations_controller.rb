class OrganizationsController < ApplicationController
  def show
    @organization = Organization.find(params[:id])
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

  private

  def organization_params
    params.require(:organization).permit(:name, :type_organization, :rfc,
                                         :mision, :address, :colonia, :town,
                                         :zip, :telephone, :email, :site, :facebook,
                                         :twitter, :youtube, :instagram, :blog,
                                         :show_address, :show_town, :show_colonia,
                                         :show_telephone, :show_zip, :show_email, :logo,causes_interest: [])
  end
end
