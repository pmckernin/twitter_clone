class AddUserReferenceToPosts < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :posts, :users
    add_index :posts, :user_id
    change_column_null :posts, :user_id, false
  end
end
