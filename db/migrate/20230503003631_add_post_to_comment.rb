class AddPostToComment < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :post, null: false, foreign_key: {to-table: :posts}
  end
end
