class UsersController < ApplicationController
  before_action :set_user, except: %i[index create]

  def index
    render json: User.all.to_json(except: [:password_digest])
  end

  def show
    render json: current_user.to_json(except: [:password_digest])
  end

  def create
    user = User.create(create_user_params)
    render json: { user: user, authToken: user.jwt_token }
  end

  def update
    render json: { error: 'cannot edit another user' }, status: 401 unless @user == current_user

    if params[:password]
      if current_user.authenticate(params[:password])
        user.update(password: params[:new_password], password_confirmation: params[:password_confirmation])
      else
        render json: { error: 'incorrect password' }
      end
    end
    
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
    params.permit(:name, :email, :password, :password_confirmation, :phone_number, :role_name, :house_id)
  end

  def update_user_params
    params.permit(:name, :email, :phone_number, :role_name, :house_id)
  end
end
