class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :tasks, dependent: :destroy

  def full_name
    [first_name, last_name].compact.reject(&:empty?).join(" ")
  end
end
