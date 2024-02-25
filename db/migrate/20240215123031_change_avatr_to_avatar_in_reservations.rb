class ChangeAvatrToAvatarInReservations < ActiveRecord::Migration[6.1]
  def change
    rename_column :reservations, :avatr, :avatar
  end
end
