class TasksController < ApplicationController
  respond_to :html, :xml
  before_action :get_resources, only: [:show, :edit, :update, :destroy, :get_task, :done_task]
  before_action :get_collections, only: [:destroy, :get_task, :done_task]

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
  end

  def edit
    render 'new'
  end

  def update
    if @task.update(task_params)
      flash[:notice] = "Project successfully updated"
      render 'show'
    else
      flash[:error] = "What's wrong?"
      render :back
    end
  end

  def destroy
    @task.destroy
    flash[:notice] = "#{ @task.name } is was removed!"
    render 'projects/show'
  end

  def get_task
    @task.to_work
    render 'projects/show'
  end

  def done_task
    @task.to_done
    render 'projects/show'
  end

  def get_resources
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:id])
  end

  def get_collections
    @tasks_new = @project.tasks.task_new.order(priority: 'DESC')
    @progress = @project.tasks.progress.order(priority: 'DESC')
    @done = @project.tasks.done.order(priority: 'DESC')
  end

  private
    def task_params
      params.require(:task).permit(:name, :text, :priority, :deadline)
    end


end