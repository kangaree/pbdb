class Ticket < ApplicationRecord
  validates :title, presence: true
  validates :ticket_type, presence: true
  validates :user_name, presence: true
  validates :user_image, presence: true

  broadcasts_to ->(ticket) { ["tickets"] }, inserts_by: :append, partial: "shared/ticket_escalations_line_item"
end