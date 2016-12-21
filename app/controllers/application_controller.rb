class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!, except: :landing

  def after_sign_in_path_for(user)
    users_path
  end
end
