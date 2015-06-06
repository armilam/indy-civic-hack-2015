class Issue < ActiveRecord::Base

  enum status: %w(active resolved)

  has_many :events
  belongs_to :owner, foreign_key: :owner_admin_id, class_name: :User

  belongs_to :subject, polymorphic: true
  belongs_to :student, -> { includes(:issues).where(issues: { subject_type: Student.name }) }, foreign_key: :subject_id
  belongs_to :application, -> { includes(:issues).where(issues: { subject_type: Application.name }) }, foreign_key: :subject_id
end