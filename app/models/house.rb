class House < ApplicationRecord
  has_many :users
  has_many :events
  has_many :documents
end
