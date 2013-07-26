require 'features_spec_helper'

describe "the signup process" do

  it "signs me up" do
    visit root_url
    click_link 'Sign up'

    fill_in 'Email', with: 'bob@bob.com'
    fill_in 'Password', with: '123'
    fill_in 'Password Confirmation', with: '123'
    click_button 'Sign Up'

    expect(page).to have_content 'Welcome to Health Tracker!'
  end
end