require 'test_helper'

class ImageHomesControllerTest < ActionController::TestCase
  setup do
    @image_home = image_homes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:image_homes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create image_home" do
    assert_difference('ImageHome.count') do
      post :create, image_home: {  }
    end

    assert_redirected_to image_home_path(assigns(:image_home))
  end

  test "should show image_home" do
    get :show, id: @image_home
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @image_home
    assert_response :success
  end

  test "should update image_home" do
    patch :update, id: @image_home, image_home: {  }
    assert_redirected_to image_home_path(assigns(:image_home))
  end

  test "should destroy image_home" do
    assert_difference('ImageHome.count', -1) do
      delete :destroy, id: @image_home
    end

    assert_redirected_to image_homes_path
  end
end
