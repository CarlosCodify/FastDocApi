class Person < ApplicationRecord
  validates :name, :surname, :lastname, presence: true
  validates :phone, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end
