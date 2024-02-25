class RemoveColumnsFromRooms < ActiveRecord::Migration[6.1]
  def change
    remove_column :rooms, :fixed_date, :date
    remove_column :rooms, :created_date, :date
  end
end
