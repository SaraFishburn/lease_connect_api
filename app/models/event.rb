class Event < ApplicationRecord
  belongs_to :house, optional: true
  belongs_to :maintenance, optional: true
end
