class Event < ApplicationRecord
  belongs_to :house
  has_one :maintenance
end
