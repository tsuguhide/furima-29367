class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
  end

  private

  # def user_params
  #   params.require(:user).permit(:nick_name, :family_name, :first_name)
  # end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_FURIMA_USER'] && password == ENV['BASIC_FURIMA_PASSWORD']
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:
      [:nick_name, :family_name, :first_name, :furigana_family_name, :furigana_first_name, :birthday])
  end
end
