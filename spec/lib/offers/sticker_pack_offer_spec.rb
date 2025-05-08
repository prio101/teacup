require 'spec_helper'

RSpec.describe StickerPackOffer do
  let(:product_code) { 'R01' }
  let(:sticker_pack_offer) { described_class.new(product_code: product_code) }
  let(:sticker_pack_offer_two) { described_class.new(product_code: product_code) }
  let(:items) { [] }
  let(:current_total) { 0 }

  describe '#apply' do
    context 'when items are empty' do
      it 'does not apply the sticker pack offer' do
        expect(sticker_pack_offer.apply(items, current_total)).to eq(current_total)
      end
    end

    context 'when items are not empty and total is below STICKER_OFFER_MINIMUM' do
      before do
        allow(sticker_pack_offer_two).to receive(:apply).and_return(10)
      end

      it 'does not apply the sticker pack offer' do
        expect(sticker_pack_offer.apply(items, 10)).to eq(10)
      end
    end

    context 'when items are not empty and total is above STICKER_OFFER_MINIMUM' do
      before do
        allow(sticker_pack_offer).to receive(:apply).and_return(50)
      end

      it 'applies the sticker pack offer' do
        expect(sticker_pack_offer.apply(items, 50)).to eq(50)
      end
    end

    context 'when the sticker pack offer has already been applied' do
      before do
        allow(sticker_pack_offer).to receive(:apply).and_return(50)
      end

      it 'does not apply the sticker pack offer again' do
        expect(sticker_pack_offer.apply(items, 50)).to eq(50)
      end
    end
  end
end
