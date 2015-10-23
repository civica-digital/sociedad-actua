class OrganizationsController < ApplicationController
  def show
    @organization = Organization.find(params[:id])
  end

  def new
    if current_user.profile.nil?
      @organization = Organization.new
    else
      redirect_to root_path
      flash[:notice] = "Ya tienes un perfil asociado."
    end
  end

  def create
    @organization = Organization.new(organization_params)
    @organization.user = current_user
    if @organization.save and current_user.profile.nil?
      flash[:notice] = "Tu información ha sido registrada. ¡Sociedad Actúa será presentado el próximo 4 de noviembre!"
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
                                         :show_telephone, :show_zip, :show_email, :logo)
  end
end
