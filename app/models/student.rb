class Student < ActiveRecord::Base
  has_many :users
  has_many :issues
  has_many :applications
end