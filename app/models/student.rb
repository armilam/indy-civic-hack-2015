class Student < ActiveRecord::Base
  has_many :issues
  has_many :applications

  has_many :user_students
  has_many :users, through: :user_students

  def full_name
    [first_name, middle_name, last_name].compact.join(" ")
  end
end
