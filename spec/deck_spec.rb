require 'spec_helper'

describe Deck do
  let(:deck) { Deck.new }

  context 'デッキが最初の状態の場合' do
    describe 'デッキは最初、52枚のカードを持つ' do
      subject { deck.cards.size }
      it { is_expected.to eq 52 }
    end

    describe 'デッキのカード順は最初、ランダムになっている' do
      subject { deck.cards }
      it { is_expected.to match_array Deck::INIT_CARDS }
      it { is_expected.to_not eq Deck::INIT_CARDS }
    end

    describe 'デッキからカードを1枚取り出せる' do
      subject { deck.card }
      it { is_expected.to satisfy { |card| Deck::INIT_CARDS.include?(card) } }
    end
  end

  context '初期状態デッキから1枚取り出した場合' do
    describe 'デッキは、51枚のカードを持つ' do
      before { deck.card }
      subject { deck.cards.size }
      it { is_expected.to eq 51 }
    end
  end
end
