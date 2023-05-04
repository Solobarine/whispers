class Post < ApplicationRecord
  belongs_to :users
  has_many :comments
  has_many :likes

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  def update_post_counter
    users.posts_counter = post.count
  end
end
