class AddStayDaysToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :stay_days, :integer
  end
end
