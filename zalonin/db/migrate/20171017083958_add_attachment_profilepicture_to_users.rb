class AddAttachmentProfilepictureToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.attachment :profilepicture
    end
  end

  def self.down
    remove_attachment :users, :profilepicture
  end
end
