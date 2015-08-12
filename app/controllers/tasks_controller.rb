class TasksController < ApplicationController
  before_action :set_task, only:[:edit, :update, :destroy, :show]

  def index
    @tasks = current_user ? current_user.tasks : (redirect_to root_path)
  end

  def show
    respond_to do |format|
      if current_user && user_signed_in?
        format.html { @task = Task.find(params[:id]) }
        format.js{}
      else
        format.html { redirect_to root_path, notice: 'Please Log in or Sign Up' }
      end
    end
  end

  def new
    if current_user
      @task = Task.new
    else
      redirect_to root_path
    end
  end

  def edit
    redirect_to root_path unless current_user == @task.user
  end

  def create
    @task = Task.new(task_params)
    @task.user = current_user
    if @task.save
      redirect_to @task, notice: 'The task was successfully created'
    else
      render :new
    end
  end

  def update
    if @task.update(task_params)
      redirect_to @task, notice: 'The task was successfully updated'
    else
      render :edit
    end
  end

  def delete
    @task = current_user.tasks.find(params[:task_id])
  end

  def destroy
    if current_user == @task.user
      @task.destroy
      redirect_to tasks_url, notice: 'The task was successfully deleted'
    else
      redirect_to :back
    end
  end

  private

    def set_task
      @task = current_user.tasks.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:title, :description, :priority, :due_date, :active)
    end
end
