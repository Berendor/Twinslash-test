require 'rails_helper'

RSpec.describe AdvertisingsType, type: :model do
  subject {
    described_class.new(name: 'cat', id: 1)
  }

  it 'type name must be unique' do
    AdvertisingsType.create(name: 'cat')
    expect(subject).to_not be_valid
  end

end
