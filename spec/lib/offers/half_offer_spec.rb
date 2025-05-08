require 'spec_helper'


RSpec.describe HalfOffer do
  let(:product_code) { 'R01' }
  let(:half_offer) { described_class.new(product_code: product_code, quantity:1) }
  let(:half_offer_two) { described_class.new(product_code: product_code) }
  let(:product) { Product.new(code: product_code, name: 'Red Widget', price: 10.00) }
  let(:product_two) { Product.new(code: 'R02', name: 'Blue Widget', price: 20.00) }
  let(:product_three) { Product.new(code: 'R03', name: 'Green Widget', price: 30.00) }
  let(:items) { [product, product_two, product_three] }

  describe '#apply' do
    context 'when items are empty' do
      it 'does not apply the half offer' do
        expect(half_offer.apply([], 0)).to eq(0)
      end
    end

    context 'when items are not empty and total is below HALF_OFFER_MINIMUM' do
      it 'does not apply the half offer' do
        expect(half_offer.apply(items, 10)).to eq(10)
      end
    end

    context 'when items are not empty and total is above HALF_OFFER_MINIMUM' do
      it 'applies the half offer' do
        expect(half_offer.apply(items, 50)).to eq(50)
      end
    end
  end
end
