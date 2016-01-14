require 'rails_helper'
require 'rspec/rails'

RSpec.describe TasksController, type: :controller do
  include Devise::TestHelpers

  describe 'Task manadgement' do
    let(:user){ create :user }
    let(:project){ create :project_for_test }
    let(:task){ create :task_for_test }

    before(:each) {
      sign_in user
    }

    it 'should creates a Task and renders to the Task page' do
      xhr :get, :new, project_id: project
      expect('new').to render_template(:new)

      xhr :post, :create, { project_id: project, task: { name: 'task', text: 'created task' } }
      should render_template(:show, project_id: project, id: :task)
      expect(response).to render_template(:show)
    end

    it 'should updates a Task and renders to the Task page' do
      xhr :get, :edit, project_id: project, id: task
      expect('new').to render_template(:new)
      expect('New Test Task').to match(task.text)

      xhr :put, :update, project_id: project, id: task, task: { text: 'Updated Task' }
      should render_template(:show, project_id: project, id: :task)
      expect(response).to render_template(:show)
      expect('Updated Task').to match(task.reload.text)
    end

    describe 'Task status' do
      it 'should have the Task status is "new"' do
        expect('new').to match(task.status)
      end

      it 'should change the Task status in "work"' do
        task.to_work
        expect('progress').to match(task.reload.status)
      end

      it 'should change the Task status in "done"' do
        task.to_done
        expect('done').to match(task.reload.status)
      end
    end

    describe 'Task priority' do

      it 'new Task will should have the priority "low"' do
        expect('low').to match(task.priority)
      end

      it 'should change the Task status in "middle"' do
        xhr :put, :update, project_id: project, id: task, task: { priority: 'middle' }
        expect('middle').to match(task.reload.priority)
      end

      it 'should change the Task status in "warning"' do
        xhr :put, :update, project_id: project, id: task, task: { priority: 'warning' }
        expect('warning').to match(task.reload.priority)
      end
    end
  end

end
