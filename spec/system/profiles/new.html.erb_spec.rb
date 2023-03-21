require 'rails_helper'

RSpec.describe 'new profile', type: :system do
  it 'renders a correct form' do
    visit new_profile_path

    expect(page).to have_selector('p', class: 'h1', text: 'Add profile')
    expect(page).to have_selector('label', text: 'Username')
    expect(page).to have_button('commit')
  end
end