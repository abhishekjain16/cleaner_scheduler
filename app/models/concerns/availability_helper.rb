module AvailabilityHelper
  def frequency_based_dates(frequency, date)
    dates = []
    case frequency.to_i
    when 1
      dates << date ### single time
    when 2
      6.times {|count| dates << date + (count*14).days } #### every 2 weeks for 3 months
    when 3
      3.times {|count| dates << date + (count*1).months } #### every 4 weeks for 3 months
    when 4
      12.times {|count| dates << date + (count*7).days }   ##### every week for 3 months
    end
    return dates
  end
end