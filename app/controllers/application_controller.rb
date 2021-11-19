class ApplicationController < ActionController::Base
  include Response
  include ExceptionHandler

  protect_from_forgery if: :json_request # return null session when API call
  protect_from_forgery with: :exception, unless: :json_request

  before_action :authorize_request, if: :json_request

  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:name, :bio, :photo, :email, :password)
    end

    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :bio, :photo, :email, :password, :current_password)
    end
  end

  private

  def json_request
    request.format.json?
  end

  def authorize_request
    @current_user = (AuthorizeApiRequest.new(request.headers).call)[:user]
  end
end
