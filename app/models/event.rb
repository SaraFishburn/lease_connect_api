class Event < ApplicationRecord
  belongs_to :house, optional: true
end
