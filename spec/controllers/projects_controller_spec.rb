require 'rails_helper'
require 'rspec/rails'

RSpec.describe ProjectsController, type: :controller do
  include Devise::TestHelpers

  describe 'Project manadgement' do
    let(:user){ create :user }
    let(:project){ create :project_for_test }

    before(:each) {
      sign_in user
    }

    it 'should creates a Project and renders to the Project page' do
      xhr :get, :new
      expect('new').to render_template(:new)

      xhr :post, :create, { project: { name: 'project', description: 'created project', owner: user.id } }
      should render_template(:show, id: :project)
      expect(response).to render_template(:show)
    end

    it 'should updates a Project and renders to the Project page' do
      xhr :get, :edit, id: project
      expect('new').to render_template(:new)
      expect('New Test Project').to match(project.description)

      xhr :put, :update, id: project, project: { description: 'Updated Project' }
      should render_template(:show, id: :project)
      expect(response).to render_template(:show)
      expect('Updated Project').to match(project.reload.description)
    end
  end

end
