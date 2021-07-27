class UsersController < ApplicationController
  before_action :set_user, except: %i[index create show]

  def index
    render json: User.all.to_json(except: [:password_digest])
  end

  def show
    render json: current_user.to_json(except: [:password_digest], include: :house)
  end

  def create
    user = User.create(create_user_params)
    render json: { user: user, authToken: user.jwt_token }
  end

  def update
    if params[:password]
      if current_user.authenticate(params[:password])
        current_user.update(password: params[:new_password], password_confirmation: params[:password_confirmation])
      else
        return render json: { error: 'incorrect password' }
      end
    end

    current_user.update(update_user_params)
    render json: current_user.to_json(except: [:password_digest])
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
