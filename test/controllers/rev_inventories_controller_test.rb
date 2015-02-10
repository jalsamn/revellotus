require 'test_helper'

class RevInventoriesControllerTest < ActionController::TestCase
  setup do
    @rev_inventory = rev_inventories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rev_inventories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rev_inventory" do
    assert_difference('RevInventory.count') do
      post :create, rev_inventory: { actual_amount: @rev_inventory.actual_amount, added_amount: @rev_inventory.added_amount, product: @rev_inventory.product, sold_amount: @rev_inventory.sold_amount, starting_amount: @rev_inventory.starting_amount, theoretical_ending_inventory: @rev_inventory.theoretical_ending_inventory, threshold: @rev_inventory.threshold, update_date: @rev_inventory.update_date }
    end

    assert_redirected_to rev_inventory_path(assigns(:rev_inventory))
  end

  test "should show rev_inventory" do
    get :show, id: @rev_inventory
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rev_inventory
    assert_response :success
  end

  test "should update rev_inventory" do
    patch :update, id: @rev_inventory, rev_inventory: { actual_amount: @rev_inventory.actual_amount, added_amount: @rev_inventory.added_amount, product: @rev_inventory.product, sold_amount: @rev_inventory.sold_amount, starting_amount: @rev_inventory.starting_amount, theoretical_ending_inventory: @rev_inventory.theoretical_ending_inventory, threshold: @rev_inventory.threshold, update_date: @rev_inventory.update_date }
    assert_redirected_to rev_inventory_path(assigns(:rev_inventory))
  end

  test "should destroy rev_inventory" do
    assert_difference('RevInventory.count', -1) do
      delete :destroy, id: @rev_inventory
    end

    assert_redirected_to rev_inventories_path
  end
end
