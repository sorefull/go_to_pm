require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #account" do
    it "returns http success" do
      get :account
      expect(response).to have_http_status(:success)
    end
  end

end
