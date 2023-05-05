require 'rails_helper'

RSpec.describe User, type: :model do
    subject { User.new(name: 'John Doe', photo: 'https://whereever.nowhere', bio: 'A simple man', posts_counter: 0)}

    before { subject.save }

    it 'Name must not be blank' do
        subject.name = nil
        expect(subject).to_not be_valid
    end
    
    it 'Post counter must be greater than or equal to zero' do
        subject.posts_counter = -3
        expect(subject).to_not be_valid
    end

    it 'Must Retrieve 3 recent Posts' do
        user = User.create!(
            name: 'Bob',
            photo: 'http://photo.com',
            bio: 'A proud man',
            posts_counter: 6
        )

        5.times do
            Post.create!(
                title: 'Title',
                text: 'Ramblings of a Man gone mad',
                author: user,
                comments_counter: 2,
                likes_counter: 3
            )
        end
        expect(user.recent_posts.size).to eq(3)
    end
end