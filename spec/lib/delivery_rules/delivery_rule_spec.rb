require 'spec_helper'

RSpec.describe DeliveryRule do
  let(:delivery_rule) { DeliveryRule.new }

  describe '#calculate' do
    context 'when subtotal is above the highest threshold' do
      it 'returns a delivery fee of 0.00' do
        expect(delivery_rule.calculate(100)).to eq(0.00)
      end
    end

    context 'when subtotal is between the highest and middle threshold' do
      it 'returns a delivery fee of 2.95' do
        expect(delivery_rule.calculate(70)).to eq(2.95)
      end
    end

    context 'when subtotal is below the lowest threshold' do
      it 'returns a delivery fee of 4.95' do
        expect(delivery_rule.calculate(30)).to eq(4.95)
      end
    end

    context 'when subtotal is exactly at a threshold' do
      it 'returns the correct delivery fee' do
        expect(delivery_rule.calculate(90)).to eq(0.00)
        expect(delivery_rule.calculate(50)).to eq(2.95)
        expect(delivery_rule.calculate(0)).to eq(4.95)
      end
    end

    context 'when subtotal is negative' do
      it 'returns a delivery fee of 4.95' do
        expect(delivery_rule.calculate(-10)).to eq(4.95)
      end
    end

    context 'when subtotal is zero' do
      it 'returns a delivery fee of 4.95' do
        expect(delivery_rule.calculate(0)).to eq(4.95)
      end
    end

  end

end
