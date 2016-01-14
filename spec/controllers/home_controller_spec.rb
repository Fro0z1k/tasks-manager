require 'rails_helper'
require 'rspec/rails'

RSpec.describe HomeController, type: :controller do

  describe 'GET "index"' do

    it 'should returns to HTTP success' do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe 'authenticated access' do
    include Devise::TestHelpers
    let(:user){ create :user }

    it "should have a current_user" do
      sign_in user
      expect(subject.current_user).to eq(user)
    end
  end

end
