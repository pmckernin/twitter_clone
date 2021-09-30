class AddSenderReferenceToDirectMessages < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :direct_messages, :users, column: :sender_id
    add_index :direct_messages, :sender_id
    change_column_null :direct_messages, :sender_id, false
  end
end
