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

cards = [Card.new(2, 'Hearts'), 
        Card.new(10, 'Diamonds'),
        Card.new(2, 'Diamonds'),
        Card.new("Ace", 'Hearts')
]
puts cards
puts cards.max
puts cards.min.rank