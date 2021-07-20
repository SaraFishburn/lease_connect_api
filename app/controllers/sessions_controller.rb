class SessionsController < ApplicationController
  def sign_in
    # find the user in the database with the param email and check if password
    # passed in params is correct
    user = User.find_by(email: params[:email]).try(:authenticate, params[:password])

    # sends user data to the frontend if user exists and password is correct
    # else error sent invalid username or password
    if user
      # call function in applocation controller that encrypts and saves json as a cookie
      save_jwt_cookie({ id: user.id })
      # provide the user information as readable json for the frontend (excluding password)
      render json: { user: user.to_json(except: %i[id password]) }
    else
      render json: { error: 'Invalid email or password' }, status: :unprocessable_entity
    end
  end

  def sign_out; end
end
