class BlueprintsController < ApplicationController

  before_action :authorize
  before_action :get_blueprints

  def index
    respond_with(@blueprints)
  end

  def show
    @blueprint = @blueprints.find(params[:id])
    respond_with(@blueprint)
  end

  def new
    @blueprint = @blueprints.new
    respond_with(@blueprint)
  end

  def edit
    @blueprint = @blueprints.find(params[:id])
  end

  def create
    @blueprint = @blueprints.new(blueprint_params) do |i|
      i.creator = current_user
    end
    @blueprint.save
    respond_with(@blueprint)
  end

  def update
    @blueprint = @blueprints.find(params[:id])
    @blueprint.update(params[:blueprint])
    respond_with(@blueprint)
  end

  def destroy
    @blueprint = @blueprints.find(params[:id])
    @blueprint.destroy
    respond_with(@blueprint)
  end

  private

  def blueprint_params
    params.require(:blueprint).permit(:title, :description, :status)
  end

  def get_blueprints
    @blueprints = Blueprint.all
  end
end
