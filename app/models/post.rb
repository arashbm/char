class Post < ActiveRecord::Base
  belongs_to :user
  has_many :reviews

  has_many :activities, as: :acted

  has_paper_trail only: [:title, :body]

  validates :title, presence: true
  validates :body, presence: true
end
