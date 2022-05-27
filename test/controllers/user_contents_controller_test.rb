require 'test_helper'

class UserContentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_content = user_contents(:one)
  end

  test 'should get index' do
    get user_contents_url
    assert_response :success
  end

  test 'should get new' do
    get new_user_content_url
    assert_response :success
  end

  test 'should create user_content' do
    assert_difference('UserContent.count') do
      post user_contents_url,
           params: { user_content: { claps: @user_content.claps, content_id: @user_content.content_id,
                                     markdownContent: @user_content.markdownContent, responseTo: @user_content.responseTo, sticked: @user_content.sticked, type: @user_content.type, user_id: @user_content.user_id } }
    end

    assert_redirected_to user_content_url(UserContent.last)
  end

  test 'should show user_content' do
    get user_content_url(@user_content)
    assert_response :success
  end

  test 'should get edit' do
    get edit_user_content_url(@user_content)
    assert_response :success
  end

  test 'should update user_content' do
    patch user_content_url(@user_content),
          params: { user_content: { claps: @user_content.claps, content_id: @user_content.content_id,
                                    markdownContent: @user_content.markdownContent, responseTo: @user_content.responseTo, sticked: @user_content.sticked, type: @user_content.type, user_id: @user_content.user_id } }
    assert_redirected_to user_content_url(@user_content)
  end

  test 'should destroy user_content' do
    assert_difference('UserContent.count', -1) do
      delete user_content_url(@user_content)
    end

    assert_redirected_to user_contents_url
  end
end
