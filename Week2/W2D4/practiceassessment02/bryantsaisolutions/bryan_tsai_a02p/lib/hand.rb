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
    sum = 0
    cards.each do |card|
      begin
        sum += card.blackjack_value
      rescue #ace exception
        sum += (sum < 11 ? 11 : 1)
      end
    end
    sum
  end

  def busted?
    points > 21
  end

  def hit(deck)
    raise "already busted" if busted?
    taken_cards = deck.take(1)
    taken_cards.each { |card| cards << card }
    cards
  end

  def beats?(other_hand)
    return false if busted?
    return true if other_hand.busted?
    points > other_hand.points
  end

  def return_cards(deck)
    deck.return(cards)
    self.cards = []
  end

  def to_s
    @cards.join(",") + " (#{points})"
  end
end
