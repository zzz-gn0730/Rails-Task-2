class RenameOldImageToNewAvatarInRooms < ActiveRecord::Migration[6.1]
  def change
    rename_column :rooms, :image, :avatar
  end
end
