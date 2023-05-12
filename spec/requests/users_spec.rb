require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'Post Methods' do
    let!(:author) do
      User.create(
        name: 'Bob',
        photo: 'http://photo.com',
        bio: 'A proud man',
        posts_counter: 0
      )
    end

    describe 'GET/ index' do
      it 'Response Status must be Correct' do
        get users_path
        expect(response).to have_http_status(:success)
      end

      it 'Must display the correct template' do
        get users_path
        expect(response).to render_template(:index)
      end

      it 'Response body must include correct text' do
        get users_path
        expect(response.body).to match(/This a list of all users/)
      end
    end

    describe 'GET/ show' do
      it 'Response Status must be Correct' do
        get user_path(author.id)
        expect(response).to have_http_status(:success)
      end

      it 'Must display the correct template' do
        get user_path(author.id)
        expect(response).to render_template(:user)
      end

      it 'Response body must include correct text' do
        get user_path(author.id)
        expect(response.body).to match(/>This is the details of a User/)
      end
    end
  end
end
