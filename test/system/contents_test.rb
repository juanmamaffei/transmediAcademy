require 'application_system_test_case'

class ContentsTest < ApplicationSystemTestCase
  setup do
    @content = contents(:one)
  end

  test 'visiting the index' do
    visit contents_url
    assert_selector 'h1', text: 'Contents'
  end

  test 'creating a Content' do
    visit contents_url
    click_on 'New Content'

    fill_in 'Chapter', with: @content.chapter_id
    fill_in 'Course', with: @content.course_id
    fill_in 'Goals', with: @content.goals
    fill_in 'Minimumscore', with: @content.minimumScore
    fill_in 'Name', with: @content.name
    fill_in 'Order', with: @content.order
    fill_in 'Priority', with: @content.priority
    fill_in 'Requirements', with: @content.requirements
    fill_in 'Richcontent', with: @content.richContent
    fill_in 'Testid', with: @content.testId
    fill_in 'Type', with: @content.type
    click_on 'Create Content'

    assert_text 'Content was successfully created'
    click_on 'Back'
  end

  test 'updating a Content' do
    visit contents_url
    click_on 'Edit', match: :first

    fill_in 'Chapter', with: @content.chapter_id
    fill_in 'Course', with: @content.course_id
    fill_in 'Goals', with: @content.goals
    fill_in 'Minimumscore', with: @content.minimumScore
    fill_in 'Name', with: @content.name
    fill_in 'Order', with: @content.order
    fill_in 'Priority', with: @content.priority
    fill_in 'Requirements', with: @content.requirements
    fill_in 'Richcontent', with: @content.richContent
    fill_in 'Testid', with: @content.testId
    fill_in 'Type', with: @content.type
    click_on 'Update Content'

    assert_text 'Content was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Content' do
    visit contents_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Content was successfully destroyed'
  end
end
