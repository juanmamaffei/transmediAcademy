require "application_system_test_case"

class UserContentsTest < ApplicationSystemTestCase
  setup do
    @user_content = user_contents(:one)
  end

  test "visiting the index" do
    visit user_contents_url
    assert_selector "h1", text: "User Contents"
  end

  test "creating a User content" do
    visit user_contents_url
    click_on "New User Content"

    fill_in "Claps", with: @user_content.claps
    fill_in "Content", with: @user_content.content_id
    fill_in "Markdowncontent", with: @user_content.markdownContent
    fill_in "Responseto", with: @user_content.responseTo
    fill_in "Sticked", with: @user_content.sticked
    fill_in "Type", with: @user_content.type
    fill_in "User", with: @user_content.user_id
    click_on "Create User content"

    assert_text "User content was successfully created"
    click_on "Back"
  end

  test "updating a User content" do
    visit user_contents_url
    click_on "Edit", match: :first

    fill_in "Claps", with: @user_content.claps
    fill_in "Content", with: @user_content.content_id
    fill_in "Markdowncontent", with: @user_content.markdownContent
    fill_in "Responseto", with: @user_content.responseTo
    fill_in "Sticked", with: @user_content.sticked
    fill_in "Type", with: @user_content.type
    fill_in "User", with: @user_content.user_id
    click_on "Update User content"

    assert_text "User content was successfully updated"
    click_on "Back"
  end

  test "destroying a User content" do
    visit user_contents_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User content was successfully destroyed"
  end
end
