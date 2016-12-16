class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: :landing
  protect_from_forgery with: :exception

  def after_sign_in_path_for(user)
    users_path
  end
end
