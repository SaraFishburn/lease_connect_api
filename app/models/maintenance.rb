class Maintenance < ApplicationRecord
  belongs_to :house
  has_one :event
end
