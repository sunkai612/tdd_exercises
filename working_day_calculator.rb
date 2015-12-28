class WorkingDayCalculator
	attr_reader :date

	def initialize(date)
		@date = date
	end

	def next_work_day
    result = date

    while(isWeekend?(result) || holiday?(result)) do 
      result = result.next_day
    end

    return result
	end

	private

  def isWeekend?(current)
    return current.sunday? || current.saturday?
  end

	def date_equal?(current, date2)
		return current.mday == date2.mday && current.month == date2.month
	end

  def holiday?(current)
    holidays = [
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

    holidays.any? do |holiday|
      date_equal?(current, holiday)
    end
  end
end
