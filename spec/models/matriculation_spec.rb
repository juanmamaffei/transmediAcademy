require 'rails_helper'

RSpec.describe Matriculation, type: :model do
  let(:course) { Course.create }
  let(:user) { User.create(email: 'a@b.com', password: 'somepass', password_confirmation: 'somepass', permissions: 10) }
  it 'does not create matriculation if course is not provided' do
    test = Matriculation.create(user_id: user.id)
    expect(test.save).to eq(false)
  end
  it 'does not create matriculation if user is not provided' do
    test = Matriculation.create(course_id: course.id)
    expect(test.save).to eq(false)
  end
  it 'creates a matriculation if user and course are provided' do
    test = Matriculation.create(course_id: course.id, user_id: user.id)
    expect(test.save).to eq(true)
  end
end

