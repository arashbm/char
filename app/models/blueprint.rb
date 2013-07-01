class Blueprint < ActiveRecord::Base
  has_many :discussions, include: :user
  belongs_to :creator, class_name: User

  validates :status, presence: true
end
