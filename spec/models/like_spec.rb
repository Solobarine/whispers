require 'rails_helper'

RSpec.describe Like, type: :model do
  it 'Updates Likes Counter in Post' do
    author = User.create(
      name: 'Bobby',
      photo: 'http://photo.com',
      bio: 'A proud man',
      posts_counter: 6
    )

    post = Post.create(
      title: 'Fake Post',
      text: 'Nonsense',
      comments_counter: 2,
      likes_counter: 0,
      author:
    )

    Like.create!(
      author:,
      post:
    )
    expect(post.likes_counter).to eq(1)
  end
end
