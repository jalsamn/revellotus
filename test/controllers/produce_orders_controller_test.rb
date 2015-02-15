require 'test_helper'

class ProduceOrdersControllerTest < ActionController::TestCase
  setup do
    @produce_order = produce_orders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:produce_orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create produce_order" do
    assert_difference('ProduceOrder.count') do
      post :create, produce_order: { orderdate: @produce_order.orderdate, vendor: @produce_order.vendor }
    end

    assert_redirected_to produce_order_path(assigns(:produce_order))
  end

  test "should show produce_order" do
    get :show, id: @produce_order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @produce_order
    assert_response :success
  end

  test "should update produce_order" do
    patch :update, id: @produce_order, produce_order: { orderdate: @produce_order.orderdate, vendor: @produce_order.vendor }
    assert_redirected_to produce_order_path(assigns(:produce_order))
  end

  test "should destroy produce_order" do
    assert_difference('ProduceOrder.count', -1) do
      delete :destroy, id: @produce_order
    end

    assert_redirected_to produce_orders_path
  end
end
