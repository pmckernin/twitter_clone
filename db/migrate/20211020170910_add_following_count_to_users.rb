class AddFollowingCountToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :followings_count, :integer
  end
end
