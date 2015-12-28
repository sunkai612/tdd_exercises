require_relative '../working_day_calculator'

RSpec.describe WorkingDayCalculator do
  describe ".previous_business_date" do
    it "1/4, 5 => 1/11" do
      input_date = Date.new(2016, 1, 3) # Saturday

      result = WorkingDayCalculator.previous_business_date(input_date)

      expect(result).to eq Date.new(2015, 12, 31)
    end
  end

  describe ".next_business_date" do
    it "weekend returns business monday" do
      input_date = Date.new(2016, 1, 2) # Saturday

      expect(WorkingDayCalculator.next_business_date(input_date)).to eq Date.new(2016, 1, 4)
    end
  end

  describe ".next_business_date_by_range" do
    it "1/4, 5 => 1/11" do
      input_date = Date.new(2016, 1, 4) # Saturday
      range = 5

      result = WorkingDayCalculator.next_business_date_by_range(input_date, range)

      expect(result).to eq Date.new(2016, 1, 11)
    end
  end
end
