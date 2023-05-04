class Comment < ApplicationRecord
  belongs_to :users
  belongs_to :posts

  def update_comment_counter
    posts.comments_counter = comment.count
  end
end
