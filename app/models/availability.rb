class Availability
  extend AvailabilityHelper

  def self.get_all_slots(start_time, end_time)
    total_slots = [start_time]
    begin
      start_time += 30.minutes
      total_slots << start_time
    end while start_time < end_time
    total_slots
  end

### need to parse date and time
  def self.get_available_slots(frequency, date, duration, cleaner)
    start_time = cleaner.start_time
    end_time = cleaner.end_time - duration.to_i.hours
    date = Date.parse(date)
    total_slots = get_all_slots(start_time, end_time)
    bookings = Booking.where(event_date: frequency_based_dates(frequency, date))
    total_slots.reject {|slot| bookings.detect { |booking| booking.start_time <= slot && booking.end_time >=  slot} }
  end
end