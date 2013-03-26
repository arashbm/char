class BlueprintsController < ApplicationController

  before_action :authorize
  before_action :get_blueprints

  def index
    respond_with(@visible_blueprints)
  end

  def show
    @blueprint = @visible_blueprints.find(params[:id])
    respond_with(@blueprint)
  end

  def new
    @blueprint = current_user.blueprints.new
    respond_with(@blueprint)
  end

  def edit
    @blueprint = @editable_blueprints.find(params[:id])
  end

  def create
    @blueprint = current_user.blueprints.create(blueprint_params)
    respond_with(@blueprint)
  end

  def update
    @blueprint = @editable_blueprints.find(params[:id])
    @blueprint.update(blueprint_params)
    respond_with(@blueprint)
  end

  def destroy
    @blueprint = current_user.blueprints.find(params[:id])
    @blueprint.destroy
    respond_with(@blueprint)
  end

  private

  def blueprint_params
    params.require(:blueprint).permit(:title, :description, :status)
  end

  def get_blueprints
    @visible_blueprints = current_user.visible_blueprints
    @editable_blueprints = current_user.editable_blueprints
  end
end
