class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  has_many :activities, as: :acted

  validates :user, presence: true
  validates :post, presence: true

  validate :one_per_post, on: :create

  def one_per_post
    if Review.where(user_id: user_id, post_id: post_id).count > 0
      errors.add :base, I18n.t('helpers.errors.more_than_one_review_per_post')
    end
  end
end

