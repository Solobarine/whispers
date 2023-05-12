class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post, class_name: 'Post'

  after_create :comments_posts_counter
  after_destroy :comments_posts_counter

  private

  def comments_posts_counter
    post.update_comments_counter
  end
end
