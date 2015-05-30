class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|

      t.timestamps
      t.time :start_time
      t.time :end_time
      t.date :event_date
      t.boolean :recurring
      t.references :user
      t.references :cleaner
    end
  end
end
