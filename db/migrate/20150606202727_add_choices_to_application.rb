class AddChoicesToApplication < ActiveRecord::Migration
  def change
    add_column :applications, :first_choice_building, :string
    add_column :applications, :first_choice_program, :string
    add_column :applications, :second_choice_building, :string
    add_column :applications, :second_choice_program, :string
    add_column :applications, :third_choice_building, :string
    add_column :applications, :third_choice_program, :string
  end
end
