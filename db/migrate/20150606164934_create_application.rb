class CreateApplication < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.integer :student_id
      t.string :wl_building
      t.string :wl_program
      t.integer :status
      t.integer :priority
      t.integer :random
      t.string :current_building
      t.string :current_program
      t.integer :current_status
      t.integer :select_number
    end
  end
end
