require 'rails_helper'

RSpec.describe Lead, type: :model do
  it 'does not create lead if email is not provided' do
    test_case = Lead.new(name: 'Pepe')
    expect(test_case.save).to eq(false)
  end
  it 'does not create lead if name is not provided' do
    test_case = Lead.new(email: 'a@b.com')
    expect(test_case.save).to eq(false)
  end
  it 'creates lead if email and name are provided' do
    test_case = Lead.new(email: 'a@b.com', name: 'Pepe')
    expect(test_case.save).to eq(true)
  end
end 

