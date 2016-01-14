require 'rails_helper'
require 'rspec/rails'

RSpec.describe DashboardController, type: :controller do

  describe 'access' do
    include Devise::TestHelpers
    let(:user){ create :user }

    it "unauthenticated access" do
      get :index
      expect(response).to redirect_to(new_user_session_path)
    end

    it 'authenticated access' do
      sign_in user
      get :index
      expect(response).to have_http_status(200)
    end
  end

end
