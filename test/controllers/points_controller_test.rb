require "test_helper"

class PointsControllerTest < ActionDispatch::IntegrationTest
  test "should get assign" do
    get points_assign_url
    assert_response :success
  end

  test "should get destroy" do
    get points_destroy_url
    assert_response :success
  end

  test "should get consult" do
    get points_consult_url
    assert_response :success
  end

  test "should get view" do
    get points_view_url
    assert_response :success
  end
end
