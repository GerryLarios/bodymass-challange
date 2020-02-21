class UsersController < ApplicationController
  include Validation
  before_action :set_user, only: [:index, :show, :update, :destroy, :category]
  skip_before_action :authenticate_request, only: [:create]
  
  # GET /users
  def index
    puts return_user
    json_response(return_user)
  end
  
  # GET /users/:id
  def show
    json_response(return_user)
  end

  # POST /users
  def create
    @user = User.create!(user_params)
    json_response(return_user, :created)
  end
  
  # PUT /users/:id
  def update
    validation = check_params(user_params)
    if validation[:success]
      @user.update(user_params)
      json_response(return_user)
    else
      json_response({ error: validation[:message] }, :unprocessable_entity)
    end
  end
  
  # DELETE /users/:id
  def destroy
    @user.destroy
    head :no_content
  end

  # get /users/:id/category
  def category
    json_response(@user.category)
  end

  private
  
  def user_params
    params.permit(:email, :password, :weight, :height)
  end

  def set_user
    @user = @current_user
  end 

  def return_user
    @user.attributes.reject { |key, value| key == 'password_digest' }
  end
end
