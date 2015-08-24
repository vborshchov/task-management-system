class TasksController < ApplicationController
  before_action :set_task, only:[:edit, :update, :delete, :show, :toggle]
  before_action :all_user_tasks, only:[:index, :update, :destroy, :create]

  def new
    if current_user
      @task = Task.new
    else
      redirect_to root_path, alert: 'Please Log in or Sign Up'
    end
  end

  def create
    @task = Task.new(task_params)
    @task.user = current_user
    flash[:success] = "The task was created successfully." if @task.save
  end

  def update
    flash[:notice] = "The task was updated successfully." if @task.update(task_params)
  end

  def destroy
    if (params[:id].map(&:to_i) - @tasks.ids).empty? && Task.destroy(params[:id])
      if params[:id].size > 1
        flash[:alert] = "#{params[:id].size} tasks were removed successfully."
      else
        flash[:alert] = "The task was deleted successfully."
      end
    end
  end

  def toggle
    @task.update_attributes(active: params[:active])
  end

  private

    def all_user_tasks
      if current_user 
        @tasks = current_user.tasks.order('created_at DESC')
      else
        redirect_to root_path, alert: 'Please Log in or Sign Up'
      end
    end

    def set_task
      if !current_user.tasks.where(id: params[:id]).empty?
        @task = current_user.tasks.find(params[:id])
      else
        redirect_to root_path, alert: 'Please Log in or Sign Up'
      end
    end

    def task_params
      params.require(:task).permit(:title, :description, :priority, :due_date, :active)
    end
end