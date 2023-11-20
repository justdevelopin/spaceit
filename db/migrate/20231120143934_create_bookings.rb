class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.integer :total_price
      t.date :starting_date
      t.date :end_date
      t.references :users, null: false, foreign_key: true
      t.references :spaces, null: false, foreign_key: true
      t.timestamps
    end
  end
end
