class TasksController < ApplicationController
  before_action :set_task, only:[:edit, :update, :destroy, :show, :toggle]
  before_action :all_user_tasks, only:[:update, :destroy, :create]

  def index
    @tasks = current_user ? current_user.tasks.order('created_at DESC') : (redirect_to root_path, alert: 'Please Log in or Sign Up')
  end

  def show
    # respond_to do |format|
    #   format.html { redirect_to root_path, alert: 'Try to use buttons on web page next time :)' }
    #   format.js
    # end
  end

  def new
    if current_user
      @task = Task.new
    else
      redirect_to root_path, alert: 'Please Log in or Sign Up'
    end
  end

  def edit
    redirect_to root_path unless current_user == @task.user
  end

  def create
    @task = Task.new(task_params)
    @task.user = current_user
    flash[:success] = "The task was created successfully." if @task.save
  end

  def update
    flash[:notice] = "The task was updated successfully." if @task.update(task_params)
  end

  def delete
    if current_user == Task.find(params[:task_id]).user
      @task = current_user.tasks.find(params[:task_id])
    else
      redirect_to root_path, alert: 'Please Log in or Sign Up'
    end
  end

  def destroy
    flash[:alert] = "The task was deleted successfully." if @task.destroy
  end

  def toggle
    @task.update_attributes(active: params[:active])
  end

  private

    def all_user_tasks
      @tasks = current_user.tasks
    end

    def set_task
      if current_user == Task.find(params[:id]).user
        @task = current_user.tasks.find(params[:id])
      else
        redirect_to root_path, alert: 'Please Log in or Sign Up'
      end
    end

    def task_params
      params.require(:task).permit(:title, :description, :priority, :due_date, :active)
    end
end
