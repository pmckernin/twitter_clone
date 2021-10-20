class AddRecievedMessageCountToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :recieved_messages_count, :integer
  end
end
