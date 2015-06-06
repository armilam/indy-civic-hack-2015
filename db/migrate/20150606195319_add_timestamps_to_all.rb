class AddTimestampsToAll < ActiveRecord::Migration
  def change
    add_timestamps(:applications)
    add_timestamps(:attachments)
    add_timestamps(:events)
    add_timestamps(:issues)
    add_timestamps(:students)
    add_timestamps(:user_students)
  end
end
