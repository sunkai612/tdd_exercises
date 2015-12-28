require 'pry'
require 'rspec'
require 'rubocop'
require_relative 'working_day_calculator'

RSpec.describe WorkingDayCalculator do
  describe '#next_work_day' do
    context 'when work day' do
      let(:cal) { WorkingDayCalculator.new(Date.new(2015, 12, 28)) }
      it 'returns this day' do
        expect(cal.next_work_day).to eq(Date.new(2015, 12, 28))
      end
    end

    context 'when holiday' do
      let(:cal) { WorkingDayCalculator.new(Date.new(2015, 2, 9)) }
      it 'returns next workday' do
        expect(cal.next_work_day).to eq(Date.new(2015, 2, 13))
      end
    end

    context 'when weekend' do
      let(:cal) { WorkingDayCalculator.new(Date.new(2015, 12, 26)) }
      it 'returns next monday' do
        expect(cal.next_work_day).to eq(Date.new(2015, 12, 28))
      end
    end
  end
end
