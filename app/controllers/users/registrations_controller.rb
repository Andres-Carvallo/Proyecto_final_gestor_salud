class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    super
  end

  # POST /resource
  def create
    super
  end

  # GET /resource/edit
  def edit
    super
  end

  # PUT /resource
  def update
    super
  end

  # DELETE /resource
  def destroy
    super
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  def cancel
    super
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:role])
  end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    if (current_user.role == "Gerencia" && current_user.client == nil)
      :new_admin
    elsif (current_user.role == "Gerencia" && current_user.client.user_id == current_user.id )
      :collaborators
    elsif (current_user.role == "Paciente" && current_user.client == nil)
      :new_client
    elsif (current_user.role == "Paciente" && current_user.client.user_id == current_user.id)
      :clients
    elsif (current_user.role == "Profesional" && current_user.client == nil)
      :new_collaborator
    elsif (current_user.role == "Profesional" && current_user.client.user_id == current_user.id)
      :collaborators
    else
      :root
    end
  end

  # The path used after sign up for inactive accounts.
  def after_inactive_sign_up_path_for(resource)
    if (current_user.role == "Gerencia" && current_user.client == nil)
      :new_admin
    elsif (current_user.role == "Gerencia" && current_user.client.user_id == current_user.id )
      :collaborators
    elsif (current_user.role == "Paciente" && current_user.client == nil)
      :new_client
    elsif (current_user.role == "Paciente" && current_user.client.user_id == current_user.id)
      :clients
    elsif (current_user.role == "Profesional" && current_user.client == nil)
      :new_collaborator
    elsif (current_user.role == "Profesional" && current_user.client.user_id == current_user.id)
      :collaborators
    else
      :root
    end
  end
end
