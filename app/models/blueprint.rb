class Blueprint < ActiveRecord::Base
  belongs_to :creator, class_name: User

  has_many :activities, as: :acted
  has_many :assignments
  has_many :discussions

  validates :status, presence: true
  validates :title, presence: true
end
