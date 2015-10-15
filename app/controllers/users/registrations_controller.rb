class Users::RegistrationsController < Devise::RegistrationsController
  protected
  def after_sign_up_path_for(resource)
    signed_in_root_path(resource)
  end

  def after_update_path_for(resource)
    signed_in_root_path(resource)
  end

  private
  def sign_up_params
    params.require(:user).permit(:roles, :email, :password, :password_confirmation)

    add_role params["roles"]
  end
end