# app/controllers/authentication_controller.rb
class AuthenticationController < ApplicationController
    # return auth token once user is authenticated
    def authenticate
      auth_token =
        AuthenticateUser.new(auth_params[:name], auth_params[:password]).call
      json_response(auth_token: auth_token)
    end
  
    private
  
    def auth_params
      params.permit(:name, :password)
    end
  end