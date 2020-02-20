class UsersController < ApplicationController
  include Validation
  before_action :set_user, only: [:show, :update, :destroy, :calculate_bmi, :category]
  skip_before_action :authenticate_request, only: [:create]
  
  # GET /users
  def index
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
    validation = check_params(user_params)
    if validation[:success]
      @user.update(user_params)
      json_response(@user)
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
    params.require(:user).permit(:email, :password, :weight, :height)
  end

  def set_user
    @user = @current_user
  end  
end
