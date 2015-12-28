require "biz"
require "biz/core_ext"

Biz.configure do |config|
  config.holidays = [
    Date.new(2016, 1, 1),
    Date.new(2016, 2, 8),
    Date.new(2016, 2, 9),
    Date.new(2016, 2, 10),
    Date.new(2016, 2, 11),
    Date.new(2016, 2, 12),
    Date.new(2016, 2, 29),
    Date.new(2016, 4, 5),
    Date.new(2016, 6, 10),
    Date.new(2016, 9, 16),
    Date.new(2016, 10, 10)
  ]
end

class WorkingDayCalculator
  def self.previous_business_date(input_date)
    business_date(input_date, move: :prev_day)
  end

  def self.next_business_date(input_date)
    business_date(input_date, move: :next)
  end

  def self.previous_business_date_by_range(input_date, range)
    business_date_by_range(input_date, range, move: :prev_day)
  end

  # 1/4, 5 => 1/11
  def self.next_business_date_by_range(input_date, range)
    business_date_by_range(input_date, range, move: :next)
  end

  def self.business_day?(input_date)
    input_date.business_day?
  end

  private

    def self.business_date(input_date, move:)
      return input_date if input_date.business_day?

      current_date = input_date

      while !current_date.business_day? # holiday
        current_date = current_date.send(move)

        return current_date if current_date.business_day?
      end
    end

    def self.business_date_by_range(input_date, range, move:)
      current_date = input_date

      while range != 0
        current_date = current_date.send(move)

        if current_date.business_day?
          range -= 1
        end
      end

      current_date
    end
end
