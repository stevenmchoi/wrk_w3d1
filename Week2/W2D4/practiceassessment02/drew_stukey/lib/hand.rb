require_relative 'deck'
require_relative 'card'

class Hand
  # This is a *factory method* that creates and returns a `Hand`
  # object.
  def self.deal_from(deck)

    Hand.new(deck.take(2))

  end

  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def points
    cards.reduce(0) do |acc, card_val|
      begin
        acc + card_val.blackjack_value
      rescue
        acc + (acc < 11 ? 11 : 1)
      end
    end
  end

  def busted?
    points > 21
  end

  def hit(deck)
    raise "already busted" if busted?
    card = deck.take(1)
    @cards += card
  end

  def beats?(other_hand)
    return false if busted?
    return true if other_hand.busted?
    self.points > other_hand.points
  end

  def return_cards(deck)
    deck.return(@cards)
    @cards = []
  end

  def to_s
    @cards.join(",") + " (#{points})"
  end
end
