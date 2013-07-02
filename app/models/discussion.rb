class Discussion < ActiveRecord::Base
  belongs_to :blueprint
  belongs_to :user

  has_many :activity, as: :acted

  validates :body, presence: true
  validates :user, presence: true
end
