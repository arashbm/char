ActiveRecord::Base.include_root_in_json = false
Rails.configuration.blueprint_status = [ 'draft', 'approved', 'dipproved' ]
Rails.configuration.workitem_status = [ 'to_do', 'in_progress', 'done', 'blocked', 'canceled', 'postponed' ]
