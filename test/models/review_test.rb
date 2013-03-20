require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  def setup
    @user1 = User.create!(email: 'arashbm@gmail.com', name: 'arash badie', password: 'sad')
    @post = @user1.posts.create!(title: 'asd', body: 'good to go')
    @rev1 = @post.reviews.create!(user: @user1, form: 'google')
  end
  test 'one review per user per post' do
    assert_raise ActiveRecord::RecordInvalid do
      @post.reviews.create!(user: @user1, form: 'google2')
    end
  end
end
