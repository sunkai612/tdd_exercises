require_relative '../working_day_calculator'

RSpec.describe WorkingDayCalculator do
  describe '#next_work_day' do
    context 'with work day' do
      let(:cal) { WorkingDayCalculator.new(Date.new(2015, 12, 28)) }
      it 'returns this day' do
        expect(cal.next_work_day).to eq(Date.new(2015, 12, 28))
      end
    end

    context 'with holiday' do
      let(:cal) { WorkingDayCalculator.new(Date.new(2015, 2, 9)) }
      it 'returns next workday' do
        expect(cal.next_work_day).to eq(Date.new(2015, 2, 13))
      end
    end

    context 'with weekend' do
      let(:cal) { WorkingDayCalculator.new(Date.new(2015, 12, 26)) }
      it 'returns next monday' do
        expect(cal.next_work_day).to eq(Date.new(2015, 12, 28))
      end
    end
  end

  describe '#prev_work_day' do
    context 'with work day' do
      let(:cal) { WorkingDayCalculator.new(Date.new(2015, 12, 28)) }
      it 'returns this day' do
        expect(cal.prev_work_day).to eq(Date.new(2015, 12, 28))
      end
    end

    context 'with holiday' do
      let(:cal) { WorkingDayCalculator.new(Date.new(2015, 2, 12)) }
      it 'returns next workday' do
        expect(cal.prev_work_day).to eq(Date.new(2015, 2, 6))
      end
    end

    context 'with weekend' do
      let(:cal) { WorkingDayCalculator.new(Date.new(2015, 12, 27)) }
      it 'returns next monday' do
        expect(cal.prev_work_day).to eq(Date.new(2015, 12, 25))
      end
    end
  end

  describe '#after_work_days_of' do
    let(:cal) { WorkingDayCalculator.new(Date.new(2015, 12, 21)) }

    context 'with 0 day' do
      it 'returns this day' do
        expect(cal.after_work_days_of(0)).to eq(Date.new(2015, 12, 21))
      end
    end

    context 'with 1 day' do
      it 'returns day after 1 workdays' do
        expect(cal.after_work_days_of(1)).to eq(Date.new(2015, 12, 22))
      end
    end

    context 'with 5 days' do
      it 'returns day after 5 workdays' do
        expect(cal.after_work_days_of(5)).to eq(Date.new(2015, 12, 28))
      end
    end

    context 'with -1 day' do
      it 'returns day before 1 workday' do
        expect(cal.after_work_days_of(-1)).to eq(Date.new(2015, 12, 18))
      end
    end

    context 'with -5 days' do
      it 'returns day before 5 workdays' do
        expect(cal.after_work_days_of(-5)).to eq(Date.new(2015, 12, 14))
      end
    end
  end

  describe '#work_day?' do
    context 'with sunday' do
      let(:cal) { WorkingDayCalculator.new(Date.new(2015, 12, 27)) }

      it 'returns false' do
        expect(cal.work_day?).to be_falsy
      end
    end

    context 'with not holiday' do
      let(:cal) { WorkingDayCalculator.new(Date.new(2015, 12, 28)) }

      it 'returns true' do
        expect(cal.work_day?).to be_truthy
      end
    end
  end
end
