class User < ApplicationRecord
  belongs_to :house, optional: true

  has_and_belongs_to_many :properties, join_table: :houses_users, class_name: "House"

  has_secure_password
end
