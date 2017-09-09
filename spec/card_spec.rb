require 'spec_helper'

describe Card do
  describe '文字を表示すること' do
    context '引数がトランプとして正しい場合' do
      context 'ランクが数字の場合' do
        let(:card) { Card.new(rank: 3, suit: '♠') }
        subject { card.notation }
        it { is_expected.to eq '3♠' }
      end
      context 'ランクが文字の場合' do
        let(:card) { Card.new(rank: 'J', suit: '♥') }
        subject { card.notation }
        it { is_expected.to eq 'J♥' }
      end
    end
    context '引数がトランプとして正しくない場合' do
      let(:card) { Card.new(rank: '0', suit: '★') }
      subject { -> { card } }
      it { is_expected.to raise_error ArgumentError }
    end
  end

  describe 'カードの比較' do
    describe 'スートの比較' do
      context '同じスートを持つ場合' do
        let(:card) { Card.new(rank: 4, suit: '♥') }
        let(:another) { Card.new(rank: 'J', suit: '♥') }
        subject { card.same_suit?(another) }
        it { is_expected.to be_truthy }
      end
      context '違うスートを持つ場合' do
        let(:card) { Card.new(rank: 'J', suit: '♦︎') }
        let(:another) { Card.new(rank: 'J', suit: '♥') }
        subject { card.same_suit?(another) }
        it { is_expected.to be_falsey }
      end
    end
    describe 'ランクの比較' do
      context '同じランクを持つ場合' do
        let(:card) { Card.new(rank: 4, suit: '♠') }
        let(:another) { Card.new(rank: 4, suit: '♥') }
        subject { card.same_rank?(another) }
        it { is_expected.to be_truthy }
      end
      context '違うランクを持つ場合' do
        let(:card) { Card.new(rank: 4, suit: '♥') }
        let(:another) { Card.new(rank: 6, suit: '♥') }
        subject { card.same_rank?(another) }
        it { is_expected.to be_falsey }
      end
    end
  end
end
