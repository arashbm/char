class DiscussionsController < ApplicationController

  # self.responder = NestedResponder

  before_action :authorize
  before_action :get_blueprint

  def index
    respond_to do |f|
      f.json { render json: @discussions.to_json(include: { user: { only: [:name, :id] }})}
    end
  end

  def create
    @discussion = @discussions.create(discussion_params) do |a|
      a.user = current_user
    end
    respond_with @blueprint, @discussion
  end

  def show
    @discussion = @discussions.find(params[:id])
    respond_with @blueprint, @discussion
  end

  private

  def get_blueprint
    @blueprint = current_user.visible_blueprints.find(params[:blueprint_id])
    @discussions = @blueprint.discussions
  end

  def discussion_params
    params.fetch(:discussion, {}).permit(:body)
  end
end
