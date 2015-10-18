class OrganizationsController < ApplicationController
  def show
    @organization = Organization.find(params[:id])
  end

  def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.new(organization_params)
    @organization.user = current_user
    if @organization.save
      flash[:notice] = "Excelente! Bienvenida a tu #{@organization.type_organization}, este es tu perfil público."
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
                                         :twitter, :youtube, :instagram, :blog)
  end
end
