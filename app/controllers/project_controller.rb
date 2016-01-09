class ProjectController < ApplicationController
  def new
    @project = Project.new
    @owner = current_user
  end

  def create
    project = Project.create(project_params)
    if project.save
      flash[:notice] = "Project successfully created"
      redirect_to dashboard_index_path
    else
      flash[:error] = "What's wrong?"
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  private
    def project_params
      params.require(:project).permit(:name, :description, :owner)
    end
end