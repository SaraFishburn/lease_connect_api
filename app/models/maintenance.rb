class Maintenance < ApplicationRecord
  belongs_to :house, optional: true
end
