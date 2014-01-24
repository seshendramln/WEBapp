require 'test_helper'

class UserViewsControllerTest < ActionController::TestCase
  setup do
    @user_view = user_views(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_views)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_view" do
    assert_difference('UserView.count') do
      post :create, user_view: { company_id: @user_view.company_id, user_id: @user_view.user_id }
    end

    assert_redirected_to user_view_path(assigns(:user_view))
  end

  test "should show user_view" do
    get :show, id: @user_view
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_view
    assert_response :success
  end

  test "should update user_view" do
    patch :update, id: @user_view, user_view: { company_id: @user_view.company_id, user_id: @user_view.user_id }
    assert_redirected_to user_view_path(assigns(:user_view))
  end

  test "should destroy user_view" do
    assert_difference('UserView.count', -1) do
      delete :destroy, id: @user_view
    end

    assert_redirected_to user_views_path
  end
end
