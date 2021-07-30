class Document < ApplicationRecord
  belongs_to :house

  validates :title, :document_url, presence: true
end
