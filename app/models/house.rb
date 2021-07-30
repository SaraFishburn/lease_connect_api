class House < ApplicationRecord
  has_many :tenants, class_name: 'User'

  has_many :events
  has_many :documents
end
