require 'application_system_test_case'

class TestsTest < ApplicationSystemTestCase
  setup do
    @test = tests(:one)
  end

  test 'visiting the index' do
    visit tests_url
    assert_selector 'h1', text: 'Tests'
  end

  test 'creating a Test' do
    visit tests_url
    click_on 'New Test'

    fill_in 'A1', with: @test.a1
    fill_in 'A2', with: @test.a2
    fill_in 'A3', with: @test.a3
    fill_in 'A4', with: @test.a4
    fill_in 'Content', with: @test.content_id
    fill_in 'Correct', with: @test.correct
    fill_in 'Difficulty', with: @test.difficulty
    fill_in 'Question', with: @test.question
    fill_in 'Score', with: @test.score
    fill_in 'State', with: @test.state
    click_on 'Create Test'

    assert_text 'Test was successfully created'
    click_on 'Back'
  end

  test 'updating a Test' do
    visit tests_url
    click_on 'Edit', match: :first

    fill_in 'A1', with: @test.a1
    fill_in 'A2', with: @test.a2
    fill_in 'A3', with: @test.a3
    fill_in 'A4', with: @test.a4
    fill_in 'Content', with: @test.content_id
    fill_in 'Correct', with: @test.correct
    fill_in 'Difficulty', with: @test.difficulty
    fill_in 'Question', with: @test.question
    fill_in 'Score', with: @test.score
    fill_in 'State', with: @test.state
    click_on 'Update Test'

    assert_text 'Test was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Test' do
    visit tests_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Test was successfully destroyed'
  end
end
