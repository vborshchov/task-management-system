class Task < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true
  validates :priority, numericality: true, allow_blank: true
  validates :due_date, in_future: true, allow_blank: true
end