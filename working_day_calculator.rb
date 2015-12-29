require 'Date'

class WorkingDayCalculator
	attr_reader :date, :custom_holidays

  DEFAULT_HOLIDAYS = [
    Date.new(2015, 1, 1),
    Date.new(2015, 2, 8),
    Date.new(2015, 2, 9),
    Date.new(2015, 2, 10),
    Date.new(2015, 2, 11),
    Date.new(2015, 2, 12),
    Date.new(2016, 2, 29),
    Date.new(2015, 4, 5),
    Date.new(2015, 6, 10),
    Date.new(2015, 9, 16),
    Date.new(2015, 10, 10)
  ]

	def initialize(date, custom_holidays=[])
		@date = date
    @custom_holidays = custom_holidays
	end

	def next_work_day
    result = date

    while(holiday?(result)) do
      result = result.next_day
    end

    result
	end

  def prev_work_day
    result = date

    while(holiday?(result)) do
      result = result.prev_day
    end

    result
  end

  def after_work_days_of(number)
    count = number
    result = date

    while count != 0 do
      result = count < 0 ? result.prev_day : result.next_day

      unless holiday?(result)
        count < 0 ? count += 1 : count -= 1
      end
    end

    result
  end

  def work_day?
    !holiday?(date)
  end

	private

  def isWeekend?(current)
    return current.sunday? || current.saturday?
  end

	def date_equal?(current, date2)
		return current.mday == date2.mday && current.month == date2.month
	end

  def holiday?(current)
    holidays = DEFAULT_HOLIDAYS + custom_holidays

    if isWeekend?(current)
      return true
    else
      holidays.any? do |holiday|
        date_equal?(current, holiday)
      end
    end
  end
end
