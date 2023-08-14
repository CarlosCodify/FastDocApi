class Document < ApplicationRecord
  validates :content, presence: true
  
  has_many :shipments
  belongs_to :document_type
end
