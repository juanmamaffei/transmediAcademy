require 'test_helper'

class MatriculationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @matriculation = matriculations(:one)
  end

  test 'should get index' do
    get matriculations_url
    assert_response :success
  end

  test 'should get new' do
    get new_matriculation_url
    assert_response :success
  end

  test 'should create matriculation' do
    assert_difference('Matriculation.count') do
      post matriculations_url,
           params: { matriculation: { course_id: @matriculation.course_id, permissions: @matriculation.permissions,
                                      user_id: @matriculation.user_id } }
    end

    assert_redirected_to matriculation_url(Matriculation.last)
  end

  test 'should show matriculation' do
    get matriculation_url(@matriculation)
    assert_response :success
  end

  test 'should get edit' do
    get edit_matriculation_url(@matriculation)
    assert_response :success
  end

  test 'should update matriculation' do
    patch matriculation_url(@matriculation),
          params: { matriculation: { course_id: @matriculation.course_id, permissions: @matriculation.permissions,
                                     user_id: @matriculation.user_id } }
    assert_redirected_to matriculation_url(@matriculation)
  end

  test 'should destroy matriculation' do
    assert_difference('Matriculation.count', -1) do
      delete matriculation_url(@matriculation)
    end

    assert_redirected_to matriculations_url
  end
end
