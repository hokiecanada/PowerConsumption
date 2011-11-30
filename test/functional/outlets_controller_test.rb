require 'test_helper'

class OutletsControllerTest < ActionController::TestCase
  setup do
    @outlet = outlets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:outlets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create outlet" do
    assert_difference('Outlet.count') do
      post :create, outlet: @outlet.attributes
    end

    assert_redirected_to outlet_path(assigns(:outlet))
  end

  test "should show outlet" do
    get :show, id: @outlet.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @outlet.to_param
    assert_response :success
  end

  test "should update outlet" do
    put :update, id: @outlet.to_param, outlet: @outlet.attributes
    assert_redirected_to outlet_path(assigns(:outlet))
  end

  test "should destroy outlet" do
    assert_difference('Outlet.count', -1) do
      delete :destroy, id: @outlet.to_param
    end

    assert_redirected_to outlets_path
  end
end
