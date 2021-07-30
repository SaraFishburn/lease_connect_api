class Event < ApplicationRecord
  belongs_to :house, optional: true

  validates :datetime, :event_type, presence: true
end
