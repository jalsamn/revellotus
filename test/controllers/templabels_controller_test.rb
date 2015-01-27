require 'test_helper'

class TemplabelsControllerTest < ActionController::TestCase
  setup do
    @templabel = templabels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:templabels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create templabel" do
    assert_difference('Templabel.count') do
      post :create, templabel: { barcode: @templabel.barcode }
    end

    assert_redirected_to templabel_path(assigns(:templabel))
  end

  test "should show templabel" do
    get :show, id: @templabel
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @templabel
    assert_response :success
  end

  test "should update templabel" do
    patch :update, id: @templabel, templabel: { barcode: @templabel.barcode }
    assert_redirected_to templabel_path(assigns(:templabel))
  end

  test "should destroy templabel" do
    assert_difference('Templabel.count', -1) do
      delete :destroy, id: @templabel
    end

    assert_redirected_to templabels_path
  end
end
