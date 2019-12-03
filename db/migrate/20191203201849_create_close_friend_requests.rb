class CreateCloseFriendRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :close_friend_requests do |t|
      t.integer :sender_id
      t.integer :recipent_id
      t.boolean :accepted

      t.timestamps
    end
  end
end
