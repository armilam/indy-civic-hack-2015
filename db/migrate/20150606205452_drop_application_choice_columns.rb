class DropApplicationChoiceColumns < ActiveRecord::Migration
  def change
    remove_column :applications, :first_choice_building, :string
    remove_column :applications, :first_choice_program, :string
    remove_column :applications, :second_choice_building, :string
    remove_column :applications, :second_choice_program, :string
    remove_column :applications, :third_choice_building, :string
    remove_column :applications, :third_choice_program, :string
  end
end
