class AddUserIdToReservations < ActiveRecord::Migration[6.1]
  def change
    add_reference :reservations, :user
  end
end
