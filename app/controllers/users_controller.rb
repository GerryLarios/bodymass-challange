class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy, :calculate_bmi, :category]
  skip_before_action :authenticate_request, only: [:create]
  
  # GET /users
  def index
    #@users = User.all
    json_response(@current_user)
  end
  
  # GET /users/:id
  def show
    json_response(@user)
  end

  # POST /users
  def create
    @user = User.create!(user_params)
    json_response(@user, :created)
  end
  
  # PUT /users/:id
  def update
    @user.update(user_params)
    json_response(@user)
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
end
