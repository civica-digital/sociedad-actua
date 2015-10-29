class Users::RegistrationsController < Devise::RegistrationsController
  before_filter :configure_sign_up_params, only: [:create]
  before_action :valid_organizations_type, only: [:create]
  before_action :get_role

  protected
  def after_sign_up_path_for(resource)
    eval("new_#{params["user"]["profile_type"].singularize}_path") # TODO: Cambiar a forma segura
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    if params[:action] == 'create'
      devise_parameter_sanitizer.for(:sign_up) {
          |u| u.permit(*REGISTRATION_PARAMS)
      }
    end
  end

  def valid_organizations_type
    unless ['collaborator', 'organization', 'investor'].include? params["user"]["profile_type"]
      flash[:notice] = "Este elemento no pertence a algun perfil valido"
      redirect_to registration_new_url
      return
    end
  end

  # Refactor this ASAP
  # This should be removed, the registration form should provide everything we need
  # and not be setting this manually
  def get_role
    if params[:user_type] || params[:user]
      @user_type = params[:user_type] || params[:user][:profile_type]
    end
  end
end
