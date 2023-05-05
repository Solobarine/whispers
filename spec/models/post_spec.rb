require 'rails_helper'

RSpec.describe Post, type: :model do
  subject do
    Post.new(
      title: 'John Doe',
      text: 'New Article',
      likes_counter: 0,
      comments_counter: 0
    )
  end

  before { subject.save }

  it 'Title should not be blank' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'Title should not exceed 250 characters' do
    subject.title = 'A' * 251
    expect(subject).to_not be_valid
  end

  it 'Comments Counter should be greater than or equal to zero' do
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end

  it 'Likes Counter should be greater than or equal to zero' do
    subject.likes_counter = -2
    expect(subject).to_not be_valid
  end

  it 'Queries 5 Recent Comments' do
    author = User.create!(
      name: 'Bob',
      photo: 'http://photo.com',
      bio: 'A proud man',
      posts_counter: 6
    )

    post = Post.create!(
      title: 'Post for comments',
      text: 'This post is awesome',
      comments_counter: 2,
      likes_counter: 3,
      author:
    )

    5.times do
      Comment.create!(
        text: 'Nice post',
        author:,
        post:
      )
    end
    expect(post.recent_comments.size).to eq(5)
  end
  it 'Updates Posts Counter in User' do
    author = User.create!(
      name: 'Bob',
      photo: 'http://photo.com',
      bio: 'A proud man',
      posts_counter: 0
    )

    Post.create!(
      title: 'Post for comments',
      text: 'This post is awesome',
      comments_counter: 2,
      likes_counter: 3,
      author:
    )

    expect(author.posts_counter).to eq(1)
  end
end
