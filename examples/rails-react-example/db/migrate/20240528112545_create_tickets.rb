class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.string :title
      t.text :content
      t.string :ticket_type
      t.string :user_name
      t.string :user_image

      t.timestamps
    end
  end
end
