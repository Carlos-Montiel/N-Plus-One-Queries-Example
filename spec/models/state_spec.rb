require 'rails_helper'

RSpec.describe State, type: :model do
  it 'has many municipalities' do
    expect(described_class.reflect_on_association(:municipalities).macro).to eq(:has_many)
  end
end
