class CreateAttachment < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.integer :application_id
    end

    add_attachment :attachments, :file
  end
end
