class DashboardsController < ApplicationController
  before_action :authorize
  def show
    if current_user.member_of_editorial?
      @activities = Activity.order('created_at DESC').first(20)
    else
      @activities = current_user.activities.order('created_at DESC').last(20)
    end
  end
end
