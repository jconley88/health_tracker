require 'spec_helper'

describe SessionsController do

  describe "POST 'create'" do
    it "redirects to root" do
      user = create :user, password: '123'
      post 'create', email: user.email, password: '123'
      expect(response).to redirect_to root_url
      expect(flash[:notice]).to match /logged in/i
      expect(flash).to_not only_be_now
    end

    it "renders new on error" do
      post 'create'
      expect(response).to render_template :new
      expect(response.status).to eq 401  #unauthorized
      expect(flash[:alert]).to match /invalid/i
      expect(flash).to only_be_now
    end
  end

  describe '#current_user' do
    it 'returns the current user' do
      user = create :user, password: '123'
      post 'create', email: user.email, password: '123'
      expect(@controller.current_user).to eq user
    end
  end
end
