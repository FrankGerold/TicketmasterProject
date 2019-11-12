class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |event|
      event.string :name
      event.string :state
      event.string :date
      event.string :type
      event.string :url
      
      event.timestamps
    end
  end
end
