class CreateDirectMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :direct_messages do |t|
      t.integer :sender_id
      t.integer :recipient_id
      t.text :body

      t.timestamps
    end
  end
end
