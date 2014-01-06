require 'test_helper'

class CompanyRatingsControllerTest < ActionController::TestCase
  setup do
    @company_rating = company_ratings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:company_ratings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create company_rating" do
    assert_difference('CompanyRating.count') do
      post :create, company_rating: { company_id: @company_rating.company_id, rating: @company_rating.rating, user_id: @company_rating.user_id }
    end

    assert_redirected_to company_rating_path(assigns(:company_rating))
  end

  test "should show company_rating" do
    get :show, id: @company_rating
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @company_rating
    assert_response :success
  end

  test "should update company_rating" do
    patch :update, id: @company_rating, company_rating: { company_id: @company_rating.company_id, rating: @company_rating.rating, user_id: @company_rating.user_id }
    assert_redirected_to company_rating_path(assigns(:company_rating))
  end

  test "should destroy company_rating" do
    assert_difference('CompanyRating.count', -1) do
      delete :destroy, id: @company_rating
    end

    assert_redirected_to company_ratings_path
  end
end
