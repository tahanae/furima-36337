class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :fairst_name, :last_name, :fairst_name_furigana, :last_name_furigana, :dete_of_birth])
  end
end
