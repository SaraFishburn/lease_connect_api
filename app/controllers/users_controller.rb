class UsersController < ApplicationController
  before_action :set_user, except: %i[index create show update]

  # return all users in the db with all their details excluding their hashed password
  def index
    # only property managers and admin should be able to perform this action
    authorized('property manager', 'admin')

    render json: User.all.as_json(except: [:password_digest])
  end     

  # return the details for the current user
  def show
    render json: current_user.to_json(except: [:password_digest], include: :house)
  end

  # method to create a user record in the db
  def create
    # only admin should be able to perform this action
    authorized('admin')

    user = User.create(create_user_params)
    if user.save
      render json: { user: user, authToken: user.jwt_token }
    else
      p user.errors.full_messages
      render json: user.errors.full_messages, status: 422
    end
  end

  # method to update current user's details in db
  def update
    # if an incorrect passowrd is given, throw an error
    if params[:password]
      unless current_user.authenticate(params[:password])
        return render json: { error: 'incorrect password' }, status: 403
      end

      current_user.update(password: params[:new_password], password_confirmation: params[:password_confirmation])
    end

    # update the users details in db and return them
    current_user.update(update_user_params)
    render json: current_user.as_json(except: [:password_digest])
  end

  # method to remove a user from the db
  def destroy
    # only property managers and admin should be able to perform this action
    authorized('property manager', 'admin')

    @user.destroy
  end

  private

  # set user (for destroy method)
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
