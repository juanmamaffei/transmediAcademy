require 'rails_helper'

RSpec.describe Course, type: :model do
  let(:course) { Course.create }
  it 'changes state from draft to published' do
    course.publish!
    expect(course.published?).to eq(true)
  end
  it 'changes state from published to draft' do
    course.publish!
    course.unpublish!
    expect(course.in_draft?).to eq(true)
  end
end
