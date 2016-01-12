class TasksController < ApplicationController
  respond_to :html, :xml

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

  def show
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:id])
  end

  def edit
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:id])
    render 'new'
  end

  def update
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:notice] = "Project successfully updated"
      render 'show'
    else
      flash[:error] = "What's wrong?"
      render :back
    end
  end

  def destroy
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:id])
    @tasks_new = @project.tasks.task_new.order(priority: 'DESC')
    @progress = @project.tasks.progress.order(priority: 'DESC')
    @done = @project.tasks.done.order(priority: 'DESC')
    @task.destroy
    flash[:notice] = "#{ @task.name } is was removed!"
    render 'projects/show'
  end

  private
    def task_params
      params.require(:task).permit(:name, :text, :priority, :deadline)
    end


end