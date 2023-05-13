require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'Post Methods' do
    let!(:author) do
      User.create(
        name: 'Bob',
        photo: 'http://photo.com',
        bio: 'A proud man',
        posts_counter: 0
      )
    end

    let!(:post) do
      Post.create(
        title: 'Post for comments',
        text: 'This post is awesome',
        comments_counter: 2,
        likes_counter: 3,
        author:
      )
    end

    describe 'GET/ index' do
      it 'Response Status must be Correct' do
        get user_posts_path(author.id)
        expect(response).to have_http_status(:success)
      end

      it 'Must display the correct template' do
        get user_posts_path(author.id)
        expect(response).to render_template(:index)
      end

      it 'Response body must include correct text' do
        get user_posts_path(author.id)
        expect(response.body).to match(/This is all the users posts/)
      end
    end

    describe 'GET/ show' do
      it 'Response Status must be Correct' do
        get user_post_path(author.id, post.id)
        expect(response).to have_http_status(:success)
      end

      it 'Must display the correct template' do
        get user_post_path(author.id, post.id)
        expect(response).to render_template(:show)
      end

      it 'Response body must include correct text' do
        get user_post_path(author.id, post.id)
        expect(response.body).to match(/>Whispers/)
      end
    end
  end
end
