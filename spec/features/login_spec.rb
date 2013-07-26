require 'features_spec_helper'

describe "the login process" do
  before :each do
    @user = create :user, :email => 'user@example.com', :password => 'caplin', :password_confirmation => 'caplin'
  end

  it "logs me in and logs me out" do
    visit root_url
    click_link 'Log in'
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: 'caplin'
    click_button 'Log In'

    expect(page).to have_content 'Logged In!'

    click_on 'Log out'
    #TODO As soon as I have user specific pages, test to make sure that one of them can't be accessed - JC 2013-7-23
  end
end