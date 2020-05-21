class AddTypeToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :pooptype, :string
  end
end
