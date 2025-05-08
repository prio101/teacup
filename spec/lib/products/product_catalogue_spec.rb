require 'spec_helper'


RSpec.describe ProductCatalogue do
  let(:product_one) { Product.new(code: 'R01', name: 'Red Widget', price: 10.00) }
  let(:product_two) { Product.new(code: 'R02', name: 'Blue Widget', price: 20.00) }
  let(:product_catalogue) { described_class.new([product_one, product_two]) }

  describe '#initialize' do
    it 'creates an empty product catalogue' do
      expect(product_catalogue).to_not be_nil
    end
  end

  describe '#find' do


    context 'when the product exists' do
      it 'returns the product' do
        expect(product_catalogue.find('R01')).to eq(product_one)
      end
    end

    context 'when the product does not exist' do
      it 'returns nil' do
        expect(product_catalogue.find('R03')).to be_nil
      end
    end
  end
end
