class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.text :detail
      t.decimal :fee
      t.decimal :total_fee
      t.string :address
      t.date :created_date
      t.datetime :check_in
      t.datetime :check_out
      t.date :fixed_date
      t.string :image

      t.timestamps
    end
  end
end
