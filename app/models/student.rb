class Student < ActiveRecord::Base
  has_many :issues
  has_many :applications

  has_many :user_students
  has_many :users, through: :user_students
end