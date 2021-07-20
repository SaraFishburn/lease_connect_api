class UserController < ApplicationController
  before_action :set_user, except: [:index, :create]
  
  def index
    render json: User.all.to_json(except: [:password_digest])
  end

  def show
    render json: @user.to_json(except: [:password_digest])
  end

  def create
    render json: User.create(create_user_params)
  end

  def update
    @user.update(update_user_params)
    render json: @user.to_json(except: [:password_digest])
  end

  def destroy
    @user.destroy
  end

  private 

  def set_user
    @user = User.find(params[:id])
  end

  def create_user_params
    params.permit(:name, :email, :password, :password_confirmation, :phone_number, :role_name)
  end
he
  def update_user_params
    params.permit(:name, :email, :phone_number, :role_name)

  end

end
