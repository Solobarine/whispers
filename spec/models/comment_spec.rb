require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'It Should Update Post Counter in Comments' do
    author = User.create(
      name: 'Bobby',
      photo: 'http://photo.com',
      bio: 'A proud man',
      posts_counter: 6
    )

    post = Post.create(
      title: 'Fake Post',
      text: 'Nonsense',
      comments_counter: 0,
      likes_counter: 0,
      author:
    )

    Comment.create!(
      text: 'Nice article',
      author:,
      post:
    )
    expect(post.comments_counter).to eq(1)
  end
end
