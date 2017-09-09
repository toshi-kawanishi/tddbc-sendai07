class Deck
  attr_reader :cards

  INIT_CARDS = [].tap do |cards|
    Card::SUITS.each do |suit|
      Card::RANKS.each do |rank|
        cards << Card.new(rank:rank, suit:suit)
      end
    end
  end

  def initialize
    @cards = INIT_CARDS.shuffle
  end

  def card
    cards.shift
  end
end
