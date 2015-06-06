class Issue < ActiveRecord::Base
  belongs_to :student
  has_many :events
  belongs_to :application
  belongs_to :owner, foreign_key: :owner_admin_id
end