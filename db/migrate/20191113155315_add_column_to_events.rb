class AddColumnToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :start_time, :text
  end
end
