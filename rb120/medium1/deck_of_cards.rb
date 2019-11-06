class Card
  include Comparable
  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{rank} of #{suit}"
  end

  def rank_value
    return rank if (2..10).include?(rank)
    case rank
    when "Jack" then 11
    when "Queen" then 12
    when "King" then 13
    when "Ace"  then 14
    end
  end

  def <=>(other_card)
    rank_value <=> other_card.rank_value
  end
end

class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze
  
  attr_accessor :cards

  def initialize
    @cards = []
  end

  def draw
    reset if cards.empty?
    cards.pop
  end

  private

  def reset
    RANKS.each do |rank|
      SUITS.each do |suit|
        cards << Card.new(rank, suit)
      end
    end
    cards.shuffle!
  end
end

deck = Deck.new
drawn = []
52.times {drawn << deck.draw}
puts drawn.count {|card| card.rank == 5}
puts drawn.count {|card| card.suit == "Hearts"}

drawn2 = []
52.times { drawn2 << deck.draw}
puts drawn != drawn2