require 'test_helper'

class ProductrequestsControllerTest < ActionController::TestCase
  setup do
    @productrequest = productrequests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:productrequests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create productrequest" do
    assert_difference('Productrequest.count') do
      post :create, productrequest: { email: @productrequest.email, fullfilled: @productrequest.fullfilled, location: @productrequest.location, name: @productrequest.name, phone: @productrequest.phone }
    end

    assert_redirected_to productrequest_path(assigns(:productrequest))
  end

  test "should show productrequest" do
    get :show, id: @productrequest
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @productrequest
    assert_response :success
  end

  test "should update productrequest" do
    patch :update, id: @productrequest, productrequest: { email: @productrequest.email, fullfilled: @productrequest.fullfilled, location: @productrequest.location, name: @productrequest.name, phone: @productrequest.phone }
    assert_redirected_to productrequest_path(assigns(:productrequest))
  end

  test "should destroy productrequest" do
    assert_difference('Productrequest.count', -1) do
      delete :destroy, id: @productrequest
    end

    assert_redirected_to productrequests_path
  end
end
