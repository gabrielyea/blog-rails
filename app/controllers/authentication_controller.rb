class AuthenticationController < ApplicationController
  # return auth token once user is authenticated
  include Response
  include ExceptionHandler

  protect_from_forgery if: :json_request # return null session when API call
  protect_from_forgery with: :exception, unless: :json_request

  before_action :authorize_request, if: :json_request

  def authenticate
    auth_token =
      AuthenticateUser.new(auth_params[:email], auth_params[:password]).call
    json_response(auth_token: auth_token)
  end

  private

  def json_request
    request.format.json?
  end

  def authorize_request
    @current_user = (AuthorizeApiRequest.new(request.headers).call)[:user]
  end

  def auth_params
    params.permit(:email, :password)
  end
end
