class DocumentType < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :documents
end
