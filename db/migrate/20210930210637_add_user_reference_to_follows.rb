class AddUserReferenceToFollows < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :follows, :users, column: :following_id
    add_index :follows, :following_id
    change_column_null :follows, :following_id, false
  end
end
