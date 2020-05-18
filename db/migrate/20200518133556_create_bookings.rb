class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.integer :user_id, null: false
      t.integer :toilet_id, null: false
      t.integer :rating
      t.text :review

      t.timestamps
    end
  end
end
