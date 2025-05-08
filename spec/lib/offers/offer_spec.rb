require 'spec_helper'

RSpec.describe Offer do
  let(:offer) { described_class.new }

  describe '#apply' do
    it 'raises NotImplementedError' do
      expect { offer.apply([], 0) }.to raise_error(NotImplementedError)
    end
  end

  describe 'STICKER_OFFER_MINIMUM' do
    it 'is defined' do
      expect(Offer::STICKER_OFFER_MINIMUM).to eq(20.0)
    end
  end
end
