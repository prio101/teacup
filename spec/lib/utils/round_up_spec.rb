require 'spec_helper'

RSpec.describe RoundUp do
  let(:round_up) { described_class }

  describe '#round_up' do
    context 'when the number is positive' do
      it 'rounds up to the nearest whole number' do
        expect(round_up.call(2.80154, 1)).to eq(2.8)
        expect(round_up.call(2.5457, 1)).to eq(2.5)
      end
    end
  end
end
