require 'test_helper'

class PhxtemplabelsControllerTest < ActionController::TestCase
  setup do
    @phxtemplabel = phxtemplabels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:phxtemplabels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create phxtemplabel" do
    assert_difference('Phxtemplabel.count') do
      post :create, phxtemplabel: { barcode: @phxtemplabel.barcode }
    end

    assert_redirected_to phxtemplabel_path(assigns(:phxtemplabel))
  end

  test "should show phxtemplabel" do
    get :show, id: @phxtemplabel
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @phxtemplabel
    assert_response :success
  end

  test "should update phxtemplabel" do
    patch :update, id: @phxtemplabel, phxtemplabel: { barcode: @phxtemplabel.barcode }
    assert_redirected_to phxtemplabel_path(assigns(:phxtemplabel))
  end

  test "should destroy phxtemplabel" do
    assert_difference('Phxtemplabel.count', -1) do
      delete :destroy, id: @phxtemplabel
    end

    assert_redirected_to phxtemplabels_path
  end
end
