class CreateUserEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :user_events do |user_event|
      user_event.integer :user_id
      user_event.integer :event_id
      user_event.timestamps
    end
  end
end
