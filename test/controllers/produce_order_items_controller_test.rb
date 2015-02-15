require 'test_helper'

class ProduceOrderItemsControllerTest < ActionController::TestCase
  setup do
    @produce_order_item = produce_order_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:produce_order_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create produce_order_item" do
    assert_difference('ProduceOrderItem.count') do
      post :create, produce_order_item: { order_id: @produce_order_item.order_id, producename: @produce_order_item.producename, quantity: @produce_order_item.quantity }
    end

    assert_redirected_to produce_order_item_path(assigns(:produce_order_item))
  end

  test "should show produce_order_item" do
    get :show, id: @produce_order_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @produce_order_item
    assert_response :success
  end

  test "should update produce_order_item" do
    patch :update, id: @produce_order_item, produce_order_item: { order_id: @produce_order_item.order_id, producename: @produce_order_item.producename, quantity: @produce_order_item.quantity }
    assert_redirected_to produce_order_item_path(assigns(:produce_order_item))
  end

  test "should destroy produce_order_item" do
    assert_difference('ProduceOrderItem.count', -1) do
      delete :destroy, id: @produce_order_item
    end

    assert_redirected_to produce_order_items_path
  end
end
