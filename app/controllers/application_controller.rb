class ApplicationController < ActionController::API
  # method to get the jwt token and decrypt and retrieve the json hash
  def jwt_cookie
    token = cookies.encrypted['login']
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

  # method to encryt json and save as a cookie
  def save_jwt_cookie(data)
    # encrypt json hash using the rails secret key
    jwt = JWT.encode(data, Rails.application.secrets.secret_key_base)

    # save encrypted json as a cookie
    cookies.encrypted['login'] = { value: jwt, httponly: true }
  end
end
