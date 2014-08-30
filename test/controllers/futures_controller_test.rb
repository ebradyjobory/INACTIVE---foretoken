require 'test_helper'

class FuturesControllerTest < ActionController::TestCase
  setup do
    @future = futures(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:futures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create future" do
    assert_difference('Future.count') do
      post :create, future: { future_year: @future.future_year }
    end

    assert_redirected_to future_path(assigns(:future))
  end

  test "should show future" do
    get :show, id: @future
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @future
    assert_response :success
  end

  test "should update future" do
    patch :update, id: @future, future: { future_year: @future.future_year }
    assert_redirected_to future_path(assigns(:future))
  end

  test "should destroy future" do
    assert_difference('Future.count', -1) do
      delete :destroy, id: @future
    end

    assert_redirected_to futures_path
  end
end
