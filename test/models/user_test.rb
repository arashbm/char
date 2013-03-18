require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user1 = User.create!(name: 'arash1', email: 'a@b.com', password: 'password')
    @user2 = User.create!(name: 'arash2', email: 'a2@b.com', password: 'password')
    @user3 = User.create!(name: 'arash3', email: 'a3@b.com', password: 'password', role: 'editorial')
    @admin = User.create!(name: 'arash badie', email: 'arashbm@gmail.com', password: 'asdasd', role:'editorial')
    @post1 = @user1.posts.create!(title: 'should_see', body: 'should_see')
    @post2 = @user2.posts.create!(title: 'shouldnt_see', body: 'shouldnt_see' )
    @post3 = @user3.posts.create!(title: 'shouldnt_see', body: 'shouldnt_see')
  end

  # -- normal non-editorial:
  test "non-editorial user can only see his own posts" do
    assert_equal 1, @user1.visible_posts.count
  end

  test "non-editorial user can only edit his own posts" do
    assert_equal 1, @user1.editable_posts.count
  end

  test "non-editorial user should see all accounts" do
    assert_equal User.count, @user1.visible_users.count
  end

  test "non-editorial user can only edit his own user account" do
    assert_equal 1, @user1.editable_users.count
  end


  # -- editorial:
  test "editorial user should see all posts" do
    assert_equal 3, @user3.visible_posts.count
  end

  test "editorial user should be able to edit all posts" do
    assert_equal 3, @user3.editable_posts.count
  end

  test "editorial user should see all accounts" do
    assert_equal User.count, @user3.visible_users.count
  end

  test "editorial user can only edit his own user account" do
    assert_equal 1, @user3.editable_users.count
  end


  # -- admin:
  test "admin user can edit all acounts" do
    assert_equal User.count, @admin.editable_users.count
  end
end
