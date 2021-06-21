# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  fixtures :owners, :zip_codes
  it 'is not valid without a name' do
    restaurant = described_class.new(name: nil, owner: owners(:one), zip_code: zip_codes(:one))
    expect(restaurant).not_to be_valid
  end

  it 'is not valid when is given an existing name' do
    described_class.create!(name: 'Restaurant one', owner: owners(:one), zip_code: zip_codes(:one))
    restaurant = described_class.new(name: 'Restaurant one', owner: owners(:one), zip_code: zip_codes(:one))
    expect(restaurant).not_to be_valid
  end

  it 'belongs to owner' do
    expect(described_class.reflect_on_association(:owner).macro).to eq(:belongs_to)
  end

  it 'belongs to zip code' do
    expect(described_class.reflect_on_association(:zip_code).macro).to eq(:belongs_to)
  end
end
