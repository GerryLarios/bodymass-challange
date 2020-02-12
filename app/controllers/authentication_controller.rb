class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request
  
  def authenticate
    command = AuthenticateUser.call(params[:email], params[:password])
    command.success? ? 
      json_response({ token: command.result }) : 
      json_response({ error: command.errors }, :unauthorized)
  end
end
