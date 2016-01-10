class ProjectsController < ApplicationController
  def new
    @project = Project.new
  end

  def create
    project = current_user.projects.build(project_params)
    if project.save
      flash[:notice] = "Project successfully created"
      redirect_to dashboard_index_path
    else
      flash[:error] = "What's wrong?"
      render :back
    end
  end

  def edit
    @project = Project.find(params[:id])
    render 'new.js.erb'
  end

  def show
    @project = Project.find(params[:id])
  end

  def update
    project = Project.find(params[:id])
    project.update(project_params)
    if project.save
      flash[:notice] = "Project successfully updated"
      redirect_to dashboard_index_path
    else
      flash[:error] = "What's wrong?"
      render :back
    end
  end

  def destroy
    project = Project.find(params[:id])
    project.delete
    flash[:notice] = "Removed #{ project.name }"
    redirect_to dashboard_index_path
  end

  private
    def project_params
      params.require(:project).permit(:name, :description)
    end
end