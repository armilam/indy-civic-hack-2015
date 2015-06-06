class MakeIssueSubjectPolymorphic < ActiveRecord::Migration
  def change
    remove_column :issues, :student_id
    remove_column :issues, :application_id

    add_column :issues, :subject_id
    add_column :issues, :subject_type
  end
end
