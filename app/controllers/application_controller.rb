class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :nickname, :gender, :age_group, :started_nail_on ])
    devise_parameter_sanitizer.permit(:account_update, keys: [ :nickname, :gender, :age_group, :started_nail_on ])
  end
end
