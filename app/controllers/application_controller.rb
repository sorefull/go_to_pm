class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!, except: :landing
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(user)
    users_path
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :skype_username, :birth_date, :phone_number, :avatar])
  end
end
