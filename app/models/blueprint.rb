class Blueprint < ActiveRecord::Base
  belongs_to :creator, class_name: User

  has_many :activities, as: :acted
  has_many :assignments
  has_many :assignees, through: :assignments
  has_many :discussions

  validates :status, presence: true
  validates :title, presence: true

  scope :unassigned, -> do
    joins(:assignments).select('blueprints.id').
      group('blueprints.id').having('count(assignmets.id) == 0')
  end
end
