# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create, :new]

  # # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    super
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:role])
  end
  def after_sign_in_path_for(resource)
    
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
