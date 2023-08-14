class Notification < ApplicationRecord
  validates :message, :send_date, presence: true

  belongs_to :motorcyclist
end
