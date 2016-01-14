require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Valid' do
    let(:user){ create :user }

    it 'should be valid' do
      expect(user).to be_valid
    end
  end

  describe 'Validations' do

    it 'is invalid without a "email"' do
      user_without_email = FactoryGirl.build(:user, email: nil)
      expect(user_without_email).to_not be_valid
    end

    it 'is invalid without a "password"' do
      user_without_password = FactoryGirl.build(:user, password: nil)
      expect(user_without_password).to_not be_valid
    end

    it "should create a new instance of a user given valid attributes" do
      user_attr = FactoryGirl.attributes_for(:user)
      user = User.create!(user_attr)
      expect(user).to be_valid
    end
  end

  describe 'with 2 or more parojets' do
    let(:user){ create :user }

    it 'should have a Projects array' do
      project_first = user.projects.create(name: Faker::Name.name, description: Faker::Lorem.sentence(50))
      project_second = user.projects.create(name: Faker::Name.name, description: Faker::Lorem.sentence(50))
      expect(user.reload.projects).to eq( [project_first, project_second] )
    end
  end

end
