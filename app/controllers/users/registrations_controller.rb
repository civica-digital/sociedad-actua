class Users::RegistrationsController < Devise::RegistrationsController
  before_filter :configure_sign_up_params, only: [:create]


  # POST /register
  def create
    unless ['collaborator', 'organization', 'investor'].include? params["user"]["role"]
      flash[:notice] = "Este elemento no pertence a algun perfil valido"
      render "new"
    end

    super
    # TODO: verificar por que el rol no fue actualizado despues
    # de agregar strong parameters
    @user.add_role params["user"]["role"]
  end


  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    registration_params = [:email, :password, :password_confirmation, :role]
    if params[:action] == 'create'
      devise_parameter_sanitizer.for(:sign_up) {
          |u| u.permit(*registration_params)
      }
    end
  end

end

