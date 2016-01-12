class ProjectsController < ApplicationController
  respond_to :html, :xml
  before_action :get_resource, only: [:edit, :show, :update, :destroy]

  def new
    @project = Project.new
  end

  def create
    @project = current_user.projects.build(project_params)
    respond_to do |format|
      if @project.save
        flash[:notice] = "Project successfully created"
        format.html { redirect_to dashboard_index_path }
        format.js   { render :show }
      else
        flash[:error] = "What's wrong?"
        render :back
      end
    end
  end

  def edit
    render 'new'
  end

  def show
    @tasks_new = @project.tasks.task_new.order(priority: 'DESC')
    @progress = @project.tasks.progress.order(priority: 'DESC')
    @done = @project.tasks.done.order(priority: 'DESC')
  end

  def update
    @tasks_new = @project.tasks.task_new.order(priority: 'DESC')
    @progress = @project.tasks.progress.order(priority: 'DESC')
    @done = @project.tasks.done.order(priority: 'DESC')
    respond_to do |format|
      if @project.update(project_params)
        flash[:notice] = "Project successfully updated"
        format.html { redirect_to dashboard_index_path }
        format.js   { render :show }
      else
        flash[:error] = "What's wrong?"
        render :back
      end
    end
  end

  def destroy
    @project.delete
    flash[:notice] = "#{ @project.name } is was removed!"
    redirect_to dashboard_index_path
  end

  def get_resource
    @project = Project.find(params[:id])
  end

  private
    def project_params
      params.require(:project).permit(:name, :description)
    end
end