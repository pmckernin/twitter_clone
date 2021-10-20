class AddRecipientReferenceToDirectMessages < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :direct_messages, :users, column: :recipient_id
    add_index :direct_messages, :recipient_id
    change_column_null :direct_messages, :recipient_id, false
  end
end
