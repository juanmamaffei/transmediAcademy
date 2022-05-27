require 'application_system_test_case'

class MatriculationsTest < ApplicationSystemTestCase
  setup do
    @matriculation = matriculations(:one)
  end

  test 'visiting the index' do
    visit matriculations_url
    assert_selector 'h1', text: 'Matriculations'
  end

  test 'creating a Matriculation' do
    visit matriculations_url
    click_on 'New Matriculation'

    fill_in 'Course', with: @matriculation.course_id
    fill_in 'Permissions', with: @matriculation.permissions
    fill_in 'User', with: @matriculation.user_id
    click_on 'Create Matriculation'

    assert_text 'Matriculation was successfully created'
    click_on 'Back'
  end

  test 'updating a Matriculation' do
    visit matriculations_url
    click_on 'Edit', match: :first

    fill_in 'Course', with: @matriculation.course_id
    fill_in 'Permissions', with: @matriculation.permissions
    fill_in 'User', with: @matriculation.user_id
    click_on 'Update Matriculation'

    assert_text 'Matriculation was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Matriculation' do
    visit matriculations_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Matriculation was successfully destroyed'
  end
end
