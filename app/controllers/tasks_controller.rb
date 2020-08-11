class TasksController < ApplicationController

  def index
    @tasks = Task.all #calling .all with active Record on Task
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @newtask = Task.new
  end

  def create
    @createdtask = Task.new(task_params)
    @createdtask.save
    redirect_to task_path(@createdtask)
  end

  def edit
    @edittask = Task.find(params[:id])
  end

  def update
    @updatedtask = Task.find(params[:id])
    @updatedtask.update(task_params)
    redirect_to task_path(@updatedtask)
  end

  def destroy
    @destask = Task.find(params[:id])
    @destask.destroy
    redirect_to task_path(@destask)
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
