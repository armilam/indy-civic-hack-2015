class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_students
  has_many :students, through: :user_students

  scope :admins, -> { where(admin: true) }
  scope :not_admins, -> { where(admin: false) }
end
