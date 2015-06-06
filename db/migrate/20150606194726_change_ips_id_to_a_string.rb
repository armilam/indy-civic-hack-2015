class ChangeIpsIdToAString < ActiveRecord::Migration
  def change
    change_column :students, :ips_id, :string
  end
end
