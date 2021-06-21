# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'owners/index', type: :view do
  before do
    assign(:owners, [
             Owner.create!(
               name: 'Jhon',
               phone: 'Phone'
             ),
             Owner.create!(
               name: 'Peter',
               phone: 'Phone2'
             )
           ])
  end

  it 'renders a list of owners names' do
    render
    assert_select 'tr>td', text: 'Jhon'.to_s, count: 1
    assert_select 'tr>td', text: 'Peter'.to_s, count: 1
  end
end
