class ChangeDecimalToIntegerInRooms < ActiveRecord::Migration[6.1]
  def change
    change_column :rooms, :fee, :integer
    change_column :rooms, :total_fee, :integer
  end
end
