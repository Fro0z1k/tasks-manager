require 'rails_helper'

RSpec.describe Project, type: :model do

  describe 'Valid' do
    let(:project){ create :project_faker }

    it 'should be valid' do
      expect(project).to be_valid
    end
  end

  describe 'Validations' do

    it 'is invalid without a "name"' do
      project_without_name = FactoryGirl.build(:project_faker, name: nil)
      expect(project_without_name).to_not be_valid
    end

    it 'is invalid without a "description"' do
      project_without_description = FactoryGirl.build(:project_faker, description: nil)
      expect(project_without_description).to_not be_valid
    end
  end

  describe 'Check columns to be present' do
    let(:project){ create :project_faker }

    it 'should have "name"' do
      expect(project.name).to be_present
    end

    it 'should have "description"' do
      expect(project.description).to be_present
    end
  end

  describe 'with 2 or more tasks' do
    let(:project){ create :project_faker }

    it 'should have a Tasks array' do
      task_first = project.tasks.create(name: 'task_first', text: 'test')
      task_second = project.tasks.create(name: 'task_second', text: 'test')
      expect(project.reload.tasks).to eq( [task_first, task_second] )
    end
  end

  describe 'with owner' do
    let(:user){ create :user }

    it 'should have a project Owner' do
      project = FactoryGirl.create(:project_faker, owner: user.id)
      expect(project.owner).to be_present
    end
  end

end
