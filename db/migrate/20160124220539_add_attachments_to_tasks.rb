class AddAttachmentsToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :attachments, :text
  end
end
