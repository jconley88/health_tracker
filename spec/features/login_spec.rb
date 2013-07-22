require 'features_spec_helper'

describe "the login process" do
  before :each do
    @user = create :user, :email => 'user@example.com', :password => 'caplin', :password_confirmation => 'caplin'
  end

  it "logs me in" do
    visit root_url
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: 'caplin'
    click_on 'Log In'

    expect(page).to have_content 'Logged In!'
  end
end