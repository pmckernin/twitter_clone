class AddLikedPostCountToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :liked_posts_count, :integer
  end
end
