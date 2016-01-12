class TasksController < ApplicationController

  def new
    @project = Project.find(params[:project_id])
    @task = Task.new
  end

  def create
    @project = Project.find(params[:project_id])
    @task = @project.tasks.build(task_params)
    if @task.save
      @tasks_new = @project.tasks.task_new.order(priority: 'DESC')
      @progress = @project.tasks.progress.order(priority: 'DESC')
      @done = @project.tasks.done.order(priority: 'DESC')
      flash[:notice] = "Project successfully created"
      render 'projects/show'
    else
      flash[:error] = "What's wrong?"
      render :back
    end
  end

  private
    def task_params
      params.require(:task).permit(:name, :text, :priority, :deadline)
    end


end