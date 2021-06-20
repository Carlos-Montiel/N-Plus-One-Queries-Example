require 'rails_helper'

RSpec.describe Municipality, type: :model do
  
  it 'belongs to state' do
    expect(described_class.reflect_on_association(:state).macro).to eq(:belongs_to)
  end 
  
  it 'has many zip codes' do
    expect(described_class.reflect_on_association(:zip_codes).macro).to eq(:has_many)
  end
end
