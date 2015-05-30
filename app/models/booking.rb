class Booking < ActiveRecord::Base
  extend AvailabilityHelper

  belongs_to :user
  belongs_to :cleaner
  validates :start_time, :end_time, :event_date, :recurring, presence: true

#### method for scheduling of bookings

  def self.schedule_booking(frequency, date, user, cleaner, start_time, duration)
    date, start_time, end_time = parse_data(date, start_time, duration)
    dates = frequency_based_dates(frequency, date)
    recurring = dates.size > 1
    dates.each do |date|
      user.bookings.create(cleaner: cleaner, start_time: start_time, end_time: start_time + duration.to_i.hours, event_date: date, recurring: recurring)
    end
  end

  def self.parse_data(date, start_time, duration)
    date = Date.parse(date)
    start_time = Time.zone.parse(start_time)
    end_time = start_time + duration
    return [date, start_time, end_time]
  end
end
