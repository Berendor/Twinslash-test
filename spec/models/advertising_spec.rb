require 'rails_helper'

RSpec.describe Advertising, type: :model do
  User.create(id: 1, email: 'test@mail.ru', password: '123456')
  AdvertisingsType.create(name: 'cat', id: 1 )
  subject {
    described_class.new(title: 'test', user_id: 1, text: 'test text', advertisings_type_id: 1)
  }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a title' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a user' do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a text' do
    subject.text = nil
    expect(subject).to_not be_valid
  end

  it 'it not valid without a advertisings_type' do
    subject.advertisings_type_id = nil
    expect(subject).to_not be_valid
  end

  it 'status after create draft' do
    ads = subject.update(status: 'new')
    expect(subject).to_not eq(ads)
  end
end
