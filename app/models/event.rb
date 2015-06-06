class Event < ActiveRecord::Base
  belongs_to :issue
  belongs_to :user
  belongs_to :admin, class_name: :User
end