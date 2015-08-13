class TasksController < ApplicationController
  before_action :set_task, only:[:edit, :update, :destroy, :show]
  before_action :all_user_tasks, only:[:update, :destroy, :create]

  def index
    @tasks = current_user ? current_user.tasks : (redirect_to root_path)
  end

  def show
    redirect_to root_path, notice: 'Please Log in or Sign Up' unless current_user
  end

  def new
    if current_user
      @task = Task.new
    else
      redirect_to root_path, notice: 'Please Log in or Sign Up'
    end
  end

  def edit
    redirect_to root_path unless current_user == @task.user
  end

  def create
    @task = Task.new(task_params)
    @task.user = current_user
    unless @task.save
      render :new
    end
  end

  def update
    unless @task.update(task_params)
      render :edit
    end
  end

  def delete
    @task = current_user.tasks.find(params[:task_id])
  end

  def destroy
    @task.destroy if current_user == @task.user
  end

  private

    def all_user_tasks
      @tasks = current_user.tasks
    end

    def set_task
      @task = current_user.tasks.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:title, :description, :priority, :due_date, :active)
    end
end
