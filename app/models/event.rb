class Event < ActiveRecord::Base
  belongs_to :issue
  belongs_to :user
  belongs_to :admin, class_name: :User

  scope :in_order, -> { order(happened_at: :desc) }
end