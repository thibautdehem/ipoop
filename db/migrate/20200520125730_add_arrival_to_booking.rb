class AddArrivalToBooking < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :arrivaltime, :string
  end
end
