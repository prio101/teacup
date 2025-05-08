require 'spec_helper'

RSpec.describe Basket do
  let(:catalogue) { ProductCatalogue.new([product1, product2, product3]) }
  let(:delivery_rule) { DeliveryRule.new }
  let(:basket) { described_class.new(catalogue: catalogue,
                                     delivery_rule: delivery_rule,
                                     offers: [
                                        HalfOffer.new(product_code: "R01", quantity: 2)
                                     ]) }
  let(:product1) { Product.new(code: 'R01', name: 'Red Widget', price: 32.95) }
  let(:product2) { Product.new(code: 'B01', name: 'Blue Widget', price: 7.95) }
  let(:product3) { Product.new(code: 'G01', name: 'Green Widget', price: 24.95) }


  describe '#add' do
    it 'adds an item to the basket' do
      basket.add(product1.code)
      expect(basket.items).to include(product1)
    end

    it 'does not add the same item twice' do
      basket.add(product1.code)
      basket.add(product1.code)
      expect(basket.items.count(product1)).to eq(2)
    end
  end

  describe '#total' do
    it 'calculates the total price of items in the basket' do
      basket.add(product1.code)
      expect(basket.total).to eq(37.9)
    end

    it 'returns 0.00 when the basket is empty' do
      expect(basket.total).to eq(0.00)
    end

    it 'should return $37.85 for B01, G01' do
      basket.add(product2.code)
      basket.add(product3.code)
      expect(basket.total).to eq(37.85)
    end

    it 'should return $54.37 for R01, R01' do
      basket.add(product1.code)
      basket.add(product1.code)

      expect(RoundUp.call(basket.total)).to eq(RoundUp.call(54.37))
    end

    it 'should return $60.85 R01, G01' do
      basket.add(product1.code)
      basket.add(product3.code)
      expect(basket.total).to eq(60.85)
    end

    it 'should return $98.27 B01, B01, R01, R01, R01' do
      basket.add(product2.code)
      basket.add(product2.code)
      basket.add(product1.code)
      basket.add(product1.code)
      basket.add(product1.code)
      expect(RoundUp.call(basket.total)).to eq(RoundUp.call(98.27))
    end
  end
end
