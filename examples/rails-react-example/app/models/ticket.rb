class Ticket < ApplicationRecord
  validates :title, presence: true
  validates :ticket_type, presence: true
  validates :user_name, presence: true
  validates :user_image, presence: true
end