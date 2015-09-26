require 'test_helper'

class UrlShortsControllerTest < ActionController::TestCase
  setup do
    @url_short = url_shorts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:url_shorts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create url_short" do
    assert_difference('UrlShort.count') do
      post :create, url_short: { code: @url_short.code, end_point: @url_short.end_point, hit_count: @url_short.hit_count }
    end

    assert_redirected_to url_short_path(assigns(:url_short))
  end

  test "should show url_short" do
    get :show, id: @url_short
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @url_short
    assert_response :success
  end

  test "should update url_short" do
    patch :update, id: @url_short, url_short: { code: @url_short.code, end_point: @url_short.end_point, hit_count: @url_short.hit_count }
    assert_redirected_to url_short_path(assigns(:url_short))
  end

  test "should destroy url_short" do
    assert_difference('UrlShort.count', -1) do
      delete :destroy, id: @url_short
    end

    assert_redirected_to url_shorts_path
  end
end
