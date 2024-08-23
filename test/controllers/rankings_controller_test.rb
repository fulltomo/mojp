require "test_helper"

class RankingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get rankings_index_url
    assert_response :success
  end

  test "should get create" do
    get rankings_create_url
    assert_response :success
  end

  test "should get ranking_params" do
    get rankings_ranking_params_url
    assert_response :success
  end
end
