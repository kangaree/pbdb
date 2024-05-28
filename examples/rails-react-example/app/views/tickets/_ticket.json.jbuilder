json.extract! ticket, :id, :title, :content, :ticket_type, :user_name, :user_image, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
