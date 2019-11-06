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
    elsif "Jack" then 11
    elsif "Queen" then 12
    elsif "King" then 13
    elsif "Ace"  then 14
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
    reset
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

class PokerHand
  
  private

  attr_accessor :hand, :rank_count

  public

  def initialize(deck_of_cards)
    @hand = []
    @rank_count = Hash.new(0)

    5.times do |num|
      card = deck_of_cards.draw
      @hand << card
      rank_count[card.rank] += 1
    end
  end

  def print
    puts hand
  end

  def evaluate
    if royal_flush?     then 'Royal flush'
    elsif straight_flush?  then 'Straight flush'
    elsif four_of_a_kind?  then 'Four of a kind'
    elsif full_house?      then 'Full house'
    elsif flush?           then 'Flush'
    elsif straight?        then 'Straight'
    elsif three_of_a_kind? then 'Three of a kind'
    elsif two_pair?        then 'Two pair'
    elsif pair?            then 'Pair'
    else                       'High card'
    end
  end

  private

  def royal_flush?
    straight_flush? && hand.min.rank == 10
  end

  def straight_flush?
    straight? && flush?
  end

  def n_of_a_kind?(number)
    rank_count.count {|_, count| count == number} == 1
  end

  def four_of_a_kind?
    n_of_a_kind?(4)
  end

  def full_house?
    n_of_a_kind?(2) && n_of_a_kind?(3)
    
  end

  def flush?
    hand.all? {|card| card.suit == hand.first.suit}
  end

  def straight?
    rank_count.all? {|_, count| count == 1} &&
    hand.max.rank_value - hand.min.rank_value == 4 
  end

  def three_of_a_kind?
    n_of_a_kind?(3)
  end

  def two_pair?
    rank_count.select {|_, count| count == 2}.size == 2
  end

  def pair?
    n_of_a_kind?(2)
  end
end

hand = PokerHand.new(Deck.new)
hand.print
puts hand.evaluate

