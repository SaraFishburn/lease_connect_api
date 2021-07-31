class User < ApplicationRecord
  belongs_to :house, optional: true

  has_secure_password

  validates :email, uniqueness: true 
  validates :name, :password_digest, :role_name, :house_id,  presence: true

  def jwt_token
    JWT.encode({ id: id, role: role_name }, Rails.application.secret_key_base)
  end
end
