require 'test_helper'

class RinventorsControllerTest < ActionController::TestCase
  setup do
    @rinventor = rinventors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rinventors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rinventor" do
    assert_difference('Rinventor.count') do
      post :create, rinventor: { actual_amount: @rinventor.actual_amount, added_amount: @rinventor.added_amount, rproductid: @rinventor.rproductid, sold_amount: @rinventor.sold_amount, starting_amount: @rinventor.starting_amount, theoretical_ending_inventory: @rinventor.theoretical_ending_inventory, threshold: @rinventor.threshold, update_date: @rinventor.update_date }
    end

    assert_redirected_to rinventor_path(assigns(:rinventor))
  end

  test "should show rinventor" do
    get :show, id: @rinventor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rinventor
    assert_response :success
  end

  test "should update rinventor" do
    patch :update, id: @rinventor, rinventor: { actual_amount: @rinventor.actual_amount, added_amount: @rinventor.added_amount, rproductid: @rinventor.rproductid, sold_amount: @rinventor.sold_amount, starting_amount: @rinventor.starting_amount, theoretical_ending_inventory: @rinventor.theoretical_ending_inventory, threshold: @rinventor.threshold, update_date: @rinventor.update_date }
    assert_redirected_to rinventor_path(assigns(:rinventor))
  end

  test "should destroy rinventor" do
    assert_difference('Rinventor.count', -1) do
      delete :destroy, id: @rinventor
    end

    assert_redirected_to rinventors_path
  end
end
