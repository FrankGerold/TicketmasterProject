class CreateFriendships < ActiveRecord::Migration[5.2]
  def change

    create_table :friendships do |friendship|
      friendship.integer :user_id
      friendship.integer :friend_id
      friendship.timestamps
    end
  end
end
