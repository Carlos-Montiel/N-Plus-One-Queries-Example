# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Owner, type: :model do
  it 'is not valid without a name' do
    owner = described_class.new(name: nil)
    expect(owner).not_to be_valid
  end

  it 'is not valid when is given an existing name' do
    described_class.create!(name: 'Jhon')
    owner = described_class.new(name: 'Jhon')
    expect(owner).not_to be_valid
  end

  it 'has many restaurants' do
    expect(described_class.reflect_on_association(:restaurants).macro).to eq(:has_many)
  end
end
