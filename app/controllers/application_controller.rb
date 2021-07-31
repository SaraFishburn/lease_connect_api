class ApplicationController < ActionController::API
  include ActionController::Cookies

  # method to get the jwt token and decrypt and retrieve the json hash
  def jwt_data
    token = request.headers['Authorization'].split(' ')[1]

    # create new hash containing json data
    begin
      HashWithIndifferentAccess.new(
        # retrieve json data from decrypted info
        JWT.decode(token, Rails.application.secrets.secret_key_base)[0]
      )
    rescue JWT::DecodeError
      nil
    end
  end

  def current_user
    puts '---------------------------------'
    puts 'CURRENT USER'
    puts @current_user
    # return User.first
    # Check if the current_user has already been calculated
    return @current_user if @current_user

    # Get the data from the jwt_cookie function
    data = jwt_data
    
    # If there is no data user isn't logged in so return nil
    return nil unless data
    
    # Find the user and save it in an instance variable for later
    # (value is also returned)
    @current_user = User.find(data[:id])
    
    puts '---------------------------------'
    puts 'CURRENT USER'
    puts @current_user
    @current_user
  end

  # Method to revoke access to controller actions to unauthorized users
  # To be included in actions that have specific permissions
  def authorized(*roles)
    return true if [*roles].include?(current_user.role_name)

    render json: { error: 'you do not have permission to perform this action' }, status: 403
    false
  end
end
