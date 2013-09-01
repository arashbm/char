class Assignment < ActiveRecord::Base
  belongs_to :assignee, class_name: User
  belongs_to :blueprint
end
