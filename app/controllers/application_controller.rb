class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nome, :role])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nome, :role])
  end

  def after_sign_in_path_for(resource)
    if resource.administrador?
      admin_dashboard_path 
    else
      root_path 
    end
  end
  
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path 
  end

end
