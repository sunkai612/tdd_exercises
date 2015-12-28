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
      input_date = Date.new(2016, 1, 2)

      expect(WorkingDayCalculator.next_business_date(input_date)).to eq Date.new(2016, 1, 4)
    end

    context "national holidays of 2016" do
      it "2016/01/01" do
        input_date = Date.new(2016, 1, 1)

        expect(WorkingDayCalculator.next_business_date(input_date)).to eq Date.new(2016, 1, 4)
      end

      it "2016/02/08" do
        input_date = Date.new(2016, 2, 8)

        expect(WorkingDayCalculator.next_business_date(input_date)).to eq Date.new(2016, 2, 15)
      end

      it "2016/02/29" do
        input_date = Date.new(2016, 2, 29)

        expect(WorkingDayCalculator.next_business_date(input_date)).to eq Date.new(2016, 3, 1)
      end

      it "2016/04/05" do
        input_date = Date.new(2016, 4, 5)

        expect(WorkingDayCalculator.next_business_date(input_date)).to eq Date.new(2016, 4, 6)
      end

      it "2016/06/10" do
        input_date = Date.new(2016, 6, 10)

        expect(WorkingDayCalculator.next_business_date(input_date)).to eq Date.new(2016, 6, 13)
      end

      it "2016/09/16" do
        input_date = Date.new(2016, 9, 16)

        expect(WorkingDayCalculator.next_business_date(input_date)).to eq Date.new(2016, 9, 19)
      end

      it "2016/10/10" do
        input_date = Date.new(2016, 10, 10)

        expect(WorkingDayCalculator.next_business_date(input_date)).to eq Date.new(2016, 10, 11)
      end
    end
  end

  describe ".next_business_date_by_range" do
    it "1/4, 5 => 1/11" do
      input_date = Date.new(2016, 1, 4)
      range = 5

      result = WorkingDayCalculator.next_business_date_by_range(input_date, range)

      expect(result).to eq Date.new(2016, 1, 11)
    end
  end
end
