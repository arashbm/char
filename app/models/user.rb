class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts
  has_many :discussions
  has_many :blueprints, foreign_key: :creator_id

  has_many :activities, foreign_key: :actor_id

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


  def editable_blueprints
    if member_of_editorial?
      Blueprint.all
    else
      blueprints
    end
  end

  def visible_blueprints
    if member_of_editorial?
      Blueprint.all
    else
      blueprints
    end
  end

  def first_name
    (name || 'کاربر').split.first
  end
end
