class Like < ApplicationRecord
    belongs_to :users
    belongs_to :posts

    def update_likes_counter
        posts.likes_counter = likes.count
    end
end