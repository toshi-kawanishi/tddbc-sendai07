class Card
  attr_reader :suit, :rank

  SUITS = %w(♠ ♥ ♣ ♦︎)
  RANKS = %w(A) + (2..10).to_a.map(&:to_s) + %w(J Q K)

  def initialize(suit:, rank:)
    rank_string = rank.to_s
    raise ArgumentError if !(SUITS.include?(suit) && RANKS.include?(rank_string))

    @suit = suit
    @rank = rank_string
  end

  def notation
    rank + suit
  end
  alias inspect notation

  def same_suit?(another)
    suit == another.suit
  end

  def same_rank?(another)
    rank == another.rank
  end
end
