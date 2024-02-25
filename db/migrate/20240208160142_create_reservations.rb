class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.string :avatr
      t.string :name
      t.decimal :total_fee
      t.text :detail
      t.date :check_in
      t.date :check_out
      t.integer :num

      t.timestamps
    end
  end
end
