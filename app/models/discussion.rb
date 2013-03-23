class Discussion < ActiveRecord::Base
  belongs_to :blueprint
  belongs_to :user

  validates :body, presence: true
  validates :user, presence: true
end
