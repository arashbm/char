class DashboardsController < ApplicationController
  before_action :authorize
  def show
    if current_user.member_of_editorial?
      @activities = Activity.order('created_at DESC').first(20)
    else
      @activities = current_user.activities.order('created_at DESC').last(20)
    end
    @blueprints = current_user.assigned_blueprints.order('due_date DESC').last(20)
    @unassigned_blueprints = Blueprint.unassigned.last(20)
  end
end
