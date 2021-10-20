class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.text :body
      t.integer :reply_to_id
      t.integer :repost_of_id

      t.timestamps
    end
  end
end
