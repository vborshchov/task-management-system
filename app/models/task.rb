class Task < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true
  validates :priority, numericality: true, format: { with: /\A[^0]\d*\z/ }
  validates_uniqueness_of :title, scope: :user_id
  # validates :due_date, in_future: true
                   
end
