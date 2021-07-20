class UserController < ApplicationController
  before_action :set_user, except: [:index, :create]
  
  def index
    render json: User.all
  end

  def show
    render json: @user
  end

  def create
    render json: User.create(user_params)
  end

  def update
    @user.update(user_params)
    render json: @user
  end

  def destroy
    @user.destroy
  end

  private 

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.permit(:name, :email, :password, :phone_number, :role_name)
  end

end
