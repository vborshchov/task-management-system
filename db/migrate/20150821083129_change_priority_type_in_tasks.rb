class ChangePriorityTypeInTasks < ActiveRecord::Migration
  def change
    change_column :tasks, :priority, :decimal, precision: 5 , scale: 2
  end
end
