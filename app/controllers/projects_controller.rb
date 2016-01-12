class ProjectsController < ApplicationController
  respond_to :html, :xml

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
    @project = Project.find(params[:id])
    render 'new'
  end

  def show
    @project = Project.find(params[:id])
    @tasks_new = @project.tasks.task_new.order(priority: 'DESC')
    @progress = @project.tasks.progress.order(priority: 'DESC')
    @done = @project.tasks.done.order(priority: 'DESC')
  end

  def update
    @project = Project.find(params[:id])
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
    @project = Project.find(params[:id])
    @project.delete
    flash[:notice] = "#{ @project.name } is was removed!"
    redirect_to dashboard_index_path
  end

  private
    def project_params
      params.require(:project).permit(:name, :description)
    end
end