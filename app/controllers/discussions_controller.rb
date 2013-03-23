class DiscussionsController < ApplicationController

  # self.responder = NestedResponder

  before_action :authorize
  before_action :get_blueprint

  def index
    respond_with @blueprint, @discussions
  end

  def create
    @discussion = @discussions.create(discussion_params) do |a|
      a.user = current_user
    end
    respond_with @blueprint, @discussion, location: blueprint_path(@blueprint)
  end

  def show
    @discussion = @discussions.find(params[:id])
    respond_with @blueprint, @discussion 
  end

  private

  def get_blueprint
    @blueprint = Blueprint.find(params[:blueprint_id])
    @discussions = @blueprint.discussions
  end

  def discussion_params
    params.require(:discussion).permit(:body)
  end
end
