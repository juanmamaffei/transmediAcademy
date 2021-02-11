require "test_helper"

class TestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @test = tests(:one)
  end

  test "should get index" do
    get tests_url
    assert_response :success
  end

  test "should get new" do
    get new_test_url
    assert_response :success
  end

  test "should create test" do
    assert_difference('Test.count') do
      post tests_url, params: { test: { a1: @test.a1, a2: @test.a2, a3: @test.a3, a4: @test.a4, content_id: @test.content_id, correct: @test.correct, difficulty: @test.difficulty, question: @test.question, score: @test.score, state: @test.state } }
    end

    assert_redirected_to test_url(Test.last)
  end

  test "should show test" do
    get test_url(@test)
    assert_response :success
  end

  test "should get edit" do
    get edit_test_url(@test)
    assert_response :success
  end

  test "should update test" do
    patch test_url(@test), params: { test: { a1: @test.a1, a2: @test.a2, a3: @test.a3, a4: @test.a4, content_id: @test.content_id, correct: @test.correct, difficulty: @test.difficulty, question: @test.question, score: @test.score, state: @test.state } }
    assert_redirected_to test_url(@test)
  end

  test "should destroy test" do
    assert_difference('Test.count', -1) do
      delete test_url(@test)
    end

    assert_redirected_to tests_url
  end
end
