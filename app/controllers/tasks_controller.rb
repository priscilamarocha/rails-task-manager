class TasksController < ApplicationController
before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index # list
    @tasks = Task.all
  end

  def show # display
    @task = Task.find(params[:id])
  end

  def new # put a new task
    @task = Task.new
  end

  def create #  the user to create
    @task = Task.new(task_params)
    if @task.save
      redirect_to task_path(@task)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit # to make possible to edit
    @task = Task.find(params[:id])
  end

  def update # to display the changes
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy # to delete
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path, status: :see_other
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
