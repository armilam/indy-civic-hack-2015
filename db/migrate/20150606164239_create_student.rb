class CreateStudent < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.integer :ips_id
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.date :birthdate
      t.string :address
      t.integer :grade
      t.string :school
    end
  end
end
