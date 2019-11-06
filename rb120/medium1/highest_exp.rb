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

  def suit_value
    case suit
    when "Diamonds" then 1
    when "Clubs" then 2
    when "Hearts" then 3
    when "Spades" then 4
    end
  end

  def <=>(other_card)
    if rank_value == other_card.rank_value
      suit_value <=> other_card.suit_value
    else
      rank_value <=> other_card.rank_value
    end
  end
end

cards = [Card.new(2, 'Hearts'), 
        Card.new(10, 'Diamonds'),
        Card.new(2, 'Diamonds'),
        Card.new("Ace", 'Hearts')
]
#puts cards
puts cards.max
puts cards.min

cards = [Card.new(4, 'Hearts'),
  Card.new(4, 'Diamonds'),
  Card.new(10, 'Clubs')]
puts cards.min
puts cards.max == Card.new(10, 'Clubs')

cards = [Card.new(7, 'Diamonds'),
  Card.new('Jack', 'Diamonds'),
  Card.new('Jack', 'Spades')]
puts cards.min == Card.new(7, 'Diamonds')
puts cards.max

cards = [Card.new(8, 'Diamonds'),
  Card.new(8, 'Clubs'),
  Card.new(8, 'Spades')]
puts cards.min
puts cards.max