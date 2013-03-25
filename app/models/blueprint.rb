class Blueprint < ActiveRecord::Base
  has_many :discussions
  belongs_to :creator, class_name: User
end
