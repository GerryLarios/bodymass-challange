class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  skip_before_action :authenticate_request, only: [:create]
  # GET /users
  def index
    @users = User.all
    json_response(@users)
  end
  
  # GET /users/:id
  def show
    json_response(@todo)
  end

  # POST /users
  def create
    @user = User.create!(user_params)
    json_response(@user, :created)
  end
  
  # PUT /users/:id
  def update
    @user.update(user_params)
    head :no_content
  end

  def destroy
    @user.destroy
    head :no_content
  end

  private
  
  def user_params
    params.permit(:email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end  
end
