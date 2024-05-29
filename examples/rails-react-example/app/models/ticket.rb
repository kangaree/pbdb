class Ticket < ApplicationRecord
  validates :title, presence: true
  validates :ticket_type, presence: true
  validates :user_name, presence: true
  validates :user_image, presence: true

  after_create_commit :broadcast_create_to_relevant_streams
  after_update_commit :broadcast_update_to_relevant_streams
  after_destroy_commit :broadcast_remove_from_relevant_streams

  private

  def broadcast_create_to_relevant_streams
    broadcast_prepend_to "tickets#{ticket_type}", 
                          partial: "shared/ticket_escalations_line_item", 
                          locals: { ticket: self }, 
                          target: "tickets#{ticket_type}"
  end

  def broadcast_update_to_relevant_streams
    if ticket_type_previously_changed?
      old_ticket_type = ticket_type_before_last_save
      # Remove from the old type stream
      broadcast_remove_to "tickets#{old_ticket_type}", target: "ticket_#{id}"
      # Prepend to the new type stream
      broadcast_prepend_to "tickets#{ticket_type}", 
                           partial: "shared/ticket_escalations_line_item", 
                           locals: { ticket: self }, 
                           target: "tickets#{ticket_type}"
    else
      # Default behavior
      broadcast_replace_to "tickets#{ticket_type}", 
                           partial: "shared/ticket_escalations_line_item", 
                           locals: { ticket: self }, 
                           target: "ticket_#{id}"
    end
  end

  def broadcast_remove_from_relevant_streams
    broadcast_remove_to "tickets#{ticket_type}", target: "ticket_#{id}"
  end
end