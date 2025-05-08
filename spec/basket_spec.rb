require 'spec_helper'

RSpec.describe Basket do
  let(:catalogue) { ProductCatalogue.new([product1]) }
  let(:delivery_rule) { DeliveryRule.new }
  let(:basket) { described_class.new(catalogue: catalogue,
                                     delivery_rule: delivery_rule,
                                     offers: []) }
  let(:product1) { Product.new(code: 'R01', name: 'Red Widget', price: 10.00) }

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
      expect(basket.total).to eq(14.95)
    end

    it 'returns 0.00 when the basket is empty' do
      expect(basket.total).to eq(0.00)
    end

    it 'returns the correct total when multiple items are added' do
      product2 = Product.new(code: 'R02', name: 'Blue Widget', price: 20.00)
      basket.add(product1.code)
      basket.add(product1.code)
      # delivery rule is applied
      expect(basket.total).to eq(24.95)
    end
  end
end
