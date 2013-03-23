require 'test_helper'

class BlueprintsControllerTest < ActionController::TestCase
  setup do
    @blueprint = blueprints(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:blueprints)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create blueprint" do
    assert_difference('Blueprint.count') do
      post :create, blueprint: { creator_id: @blueprint.creator_id, description: @blueprint.description, status: @blueprint.status, title: @blueprint.title }
    end

    assert_redirected_to blueprint_path(assigns(:blueprint))
  end

  test "should show blueprint" do
    get :show, id: @blueprint
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @blueprint
    assert_response :success
  end

  test "should update blueprint" do
    patch :update, id: @blueprint, blueprint: { creator_id: @blueprint.creator_id, description: @blueprint.description, status: @blueprint.status, title: @blueprint.title }
    assert_redirected_to blueprint_path(assigns(:blueprint))
  end

  test "should destroy blueprint" do
    assert_difference('Blueprint.count', -1) do
      delete :destroy, id: @blueprint
    end

    assert_redirected_to blueprints_path
  end
end
