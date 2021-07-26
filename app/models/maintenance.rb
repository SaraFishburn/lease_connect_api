class Maintenance < ApplicationRecord
  belongs_to :house, optional: true
  has_one :event
end
