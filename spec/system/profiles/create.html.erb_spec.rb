require 'rails_helper'

RSpec.describe 'create profile', type: :system do
  it 'username is blank' do
    visit new_profile_path
    click_button 'Create Profile'

    expect(page).to have_content('Username can\'t be blank')
    expect(Profile.count).to eq(0)
  end

  it 'username have a character incorrect' do
    visit new_profile_path
    fill_in 'Username', with: '*Incorrect'
    click_button 'Create Profile'

    expect(page).to have_content('Username may only contain alphanumeric characters and hyphens (-)')
    expect(Profile.count).to eq(0)
  end

  it 'username is already in DB' do
    create(:profile, username: 'repeat-')
    visit new_profile_path
    fill_in 'Username', with: 'repeat-'
    click_button 'Create Profile'

    expect(page).to have_content('Username has already been taken')
    expect(Profile.count).to eq(1)
  end

  it 'all is ok' do
    visit new_profile_path
    fill_in 'Username', with: 'successful-'
    click_button 'Create Profile'

    expect(page).to have_content('New profile created: successful-')
    expect(Profile.count).to eq(1)
  end
end