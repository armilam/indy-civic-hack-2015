class CreateEvent < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :issue_id
      t.string :method
      t.integer :user_id
      t.integer :admin_id
      t.string :description
      t.datetime :happened_at
    end
  end
end
