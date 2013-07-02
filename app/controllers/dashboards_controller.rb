class DashboardsController < ApplicationController
  before_action :authorize
  def show
    @activities = Activity.order('created_at DESC').last(20)
  end
end
