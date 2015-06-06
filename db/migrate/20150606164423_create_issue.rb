class CreateIssue < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.integer :student_id
      t.integer :application_id
      t.integer :owner_admin_id
      t.string :description
      t.integer :status
    end
  end
end
