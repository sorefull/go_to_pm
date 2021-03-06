class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!, except: :landing
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(user)
    user.admin? ? admin_users_path : current_user
  end

  include Pundit

  protected
  def configure_permitted_parameters
    if controller_name == 'registrations' && action_name == 'new'
      ivititation = Invitation.find_by(secure_key: params[:secure_key])
      raise ActionController::RoutingError.new('Not Found') unless ivititation
    end
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :skype_username, :birth_date, :phone_number, :avatar, :secure_key])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :skype_username, :birth_date, :phone_number, :avatar])
  end
end
