require 'test_helper'

class TemplablesphxesControllerTest < ActionController::TestCase
  setup do
    @templablesphx = templablesphxes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:templablesphxes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create templablesphx" do
    assert_difference('Templablesphx.count') do
      post :create, templablesphx: {  }
    end

    assert_redirected_to templablesphx_path(assigns(:templablesphx))
  end

  test "should show templablesphx" do
    get :show, id: @templablesphx
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @templablesphx
    assert_response :success
  end

  test "should update templablesphx" do
    patch :update, id: @templablesphx, templablesphx: {  }
    assert_redirected_to templablesphx_path(assigns(:templablesphx))
  end

  test "should destroy templablesphx" do
    assert_difference('Templablesphx.count', -1) do
      delete :destroy, id: @templablesphx
    end

    assert_redirected_to templablesphxes_path
  end
end
