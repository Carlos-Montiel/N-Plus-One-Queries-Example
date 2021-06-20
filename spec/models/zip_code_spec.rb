require 'rails_helper'

RSpec.describe ZipCode, type: :model do
  it 'belongs to municipality' do
    expect(described_class.reflect_on_association(:municipality).macro).to eq(:belongs_to)
  end 
end
