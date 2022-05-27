require 'rails_helper'

RSpec.describe Test, type: :model do
  it 'does not create test if content is not provided' do
    expect{ Test.create! }.to raise_error(ActiveRecord::RecordInvalid)
  end
  it 'creates a test if a valid content is provided' do
    course = Course.create
    chapter = Chapter.create(course_id: course.id)
    content = Content.create(course_id: course.id, chapter_id: chapter.id)
    test = Test.new(content_id: content.id)
    expect(test.save).to eq(true)
  end
end
