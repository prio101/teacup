require 'spec_helper'

RSpec.describe Product do
  let(:product) { Product.new(code: 'R01', name: 'Red Widget', price: 10.00) }
  let(:product_two) { Product.new(code: 'R02', name: 'Blue Widget', price: 20.00) }

  describe '#initialize' do
    it 'creates a new product with the given attributes' do
      expect(product.code).to eq('R01')
      expect(product.name).to eq('Red Widget')
      expect(product.price).to eq(10.00)
    end

    it 'raises an error if the code is not provided' do
      expect { Product.new(name: 'Red Widget', price: 10.00) }.to raise_error(ArgumentError)
    end
  end
end
