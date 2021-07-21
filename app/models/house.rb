class House < ApplicationRecord
  has_many :tenants, class_name: 'User'

  has_and_belongs_to_many :property_managers, join_table: :houses_users, class_name: "User"

  has_many :events
  has_many :documents
end
