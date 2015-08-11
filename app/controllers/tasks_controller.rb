class TasksController < ApplicationController
  before_action :set_task, only:[:edit, :update, :destroy]

  def index
    @tasks = current_user ? current_user.tasks : (redirect_to root_path)
  end

  def show
    if current_user
      @task = Task.find(params[:id]) 
    else
      redirect_to root_path
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
      redirect_to @task, notice: 'Завдання було успішно створено'
    else
      render :new
    end
  end

  def update
    if @task.update(task_params)
      redirect_to @task, notice: 'Завдання було успішно оновлено'
    else
      render :edit
    end
  end

  def destroy
    if current_user == @task.user
      @task.destroy
      redirect_to tasks_url, notice: 'Завдання було успішно видалено'
    else
      redirect_to :back
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:title, :description, :priority, :due_date, :active)
    end
end
