class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:fullname,:organization,:about,:status])
    devise_parameter_sanitizer.permit(:account_update, keys: [:fullname,:organization,:about,:status,:language])
  end
  # redirect after login 
  def after_sign_in_path_for(resources)
    dashboard_path
  end
end
