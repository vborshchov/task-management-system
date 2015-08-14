class Task < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true
  validates :priority, inclusion: {in: (1..100)}
  validates_uniqueness_of :title, scope: :user_id
  # validates :due_date, in_future: true
                   
end
