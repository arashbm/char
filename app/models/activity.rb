class Activity < ActiveRecord::Base
  belongs_to :acted, polymorphic: true
  belongs_to :actor, class_name: User

  store :parameters
end
