require "test_helper"

class QuizControllerTest < ActionDispatch::IntegrationTest
  test "should get start" do
    get quiz_start_url
    assert_response :success
  end

  test "should get question" do
    get quiz_question_url
    assert_response :success
  end

  test "should get submit_answer" do
    get quiz_submit_answer_url
    assert_response :success
  end

  test "should get result" do
    get quiz_result_url
    assert_response :success
  end
end
