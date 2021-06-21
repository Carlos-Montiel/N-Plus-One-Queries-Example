# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'restaurants/index', type: :view do
  fixtures :owners, :states
  before do
    municipality = Municipality.create!(name: 'Pachuca', state: states(:one))
    zip_code = ZipCode.create!(name: '43150', municipality_id: municipality.id)
    assign(:restaurants, [
             Restaurant.create!(
               owner: owners(:one),
               name: 'Restaurant 1',
               restaurant_type: 'Mexican',
               description: 'A restaurant description',
               zip_code_id: zip_code.id
             ),
             Restaurant.create!(
               owner: owners(:one),
               name: 'Restaurant 2',
               restaurant_type: 'Mexican',
               description: 'A restaurant description',
               zip_code_id: zip_code.id
             )
           ])
  end

  it 'shows the names' do
    render
    assert_select 'tr>td', text: 'Restaurant 1'.to_s, count: 1
    assert_select 'tr>td', text: 'Restaurant 2'.to_s, count: 1
  end

  it 'shows the description and type of restaurants' do
    render
    assert_select 'tr>td', text: 'Mexican'.to_s, count: 2
    assert_select 'tr>td', text: 'A restaurant description'.to_s, count: 2
  end

  it 'shows owners and addresses' do
    render
    assert_select 'tr>td', text: owners(:one).name.to_s, count: 2
    assert_select 'tr>td', text: states(:one).name.to_s, count: 2
    assert_select 'tr>td', text: 'Pachuca'.to_s, count: 2
    assert_select 'tr>td', text: '43150'.to_s, count: 2
  end
end
