require 'spec_helper'

describe UsersController do

  describe "POST 'create'" do
    it "redirects to root" do
      post 'create', user: { email: 'bob@bob.com', password: '123', password_confirmation: '123' }

      expect(response).to redirect_to root_url
      expect(flash[:notice]).to match /welcome/i
      expect(flash).to_not only_be_now
    end

    it "renders new on error" do
      post 'create', user: {email: 'email'}

      expect(response).to render_template :new
      expect(response.status).to eq 422  #unprocessable_entity
    end
  end
end
