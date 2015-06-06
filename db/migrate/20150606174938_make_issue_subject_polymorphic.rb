class MakeIssueSubjectPolymorphic < ActiveRecord::Migration
  def change
    remove_column :issues, :student_id, :integer
    remove_column :issues, :application_id, :integer

    add_column :issues, :subject_id, :integer
    add_column :issues, :subject_type, :string
  end
end
