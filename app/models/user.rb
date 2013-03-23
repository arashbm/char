class User < ActiveRecord::Base
  include Clearance::User
  has_many :posts
  has_many :discussions
  has_many :blueprint, foreign_key: :creator_id

  validates :name, presence: true

  def admin?
    # make it configurable!
    ['arashbm@gmail.com'].include? email
  end
  
  def member_of_editorial?
    role == 'editorial'
  end

  def visible_users
    User.all
  end

  def editable_users
    if admin?
      User.all
    else
      User.where(id: id)
    end
  end

  def editable_posts
    if member_of_editorial?
      Post.all
    else
      posts
    end
  end

  def visible_posts
    if member_of_editorial?
      Post.all
    else
      posts
    end
  end

  def first_name
    name.split.first
  end
end
