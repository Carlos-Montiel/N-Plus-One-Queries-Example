# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ZipCode, type: :model do
  it 'belongs to municipality' do
    expect(described_class.reflect_on_association(:municipality).macro).to eq(:belongs_to)
  end

  it 'has many restaurants' do
    expect(described_class.reflect_on_association(:restaurants).macro).to eq(:has_many)
  end
end
