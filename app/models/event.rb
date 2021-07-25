class Event < ApplicationRecord
  belongs_to :house
  belongs_to :maintenance
end
