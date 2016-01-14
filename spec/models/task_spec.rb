require 'rails_helper'

RSpec.describe Task, type: :model do

  describe 'Valid' do
    let(:task){ create :task_faker }

    it 'should be valid' do
      expect(task).to be_valid
    end
  end

  describe 'Validations' do

    it 'is invalid without a "name"' do
      task_without_name = FactoryGirl.build(:task_faker, name: nil)
      expect(task_without_name).to_not be_valid
    end

    it 'is invalid without a "text"' do
      task_without_text = FactoryGirl.build(:task_faker, text: nil)
      expect(task_without_text).to_not be_valid
    end
  end

  describe 'Check columns to be present' do
    let(:task){ create :task_faker }

    it 'should have "name"' do
      expect(task.name).to be_present
    end

    it 'should have "text"' do
      expect(task.text).to be_present
    end
  end

  describe 'with project' do
    let(:project){ create :project_faker }

    it 'should have a task "project_id"' do
      task = FactoryGirl.create(:task_faker, project_id: project.id)
      expect(task.project_id).to be_present
    end
  end

end
