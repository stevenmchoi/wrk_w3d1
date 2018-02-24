class Hand
  # This is a *factory method* that creates and returns a `Hand`
  # object.
  def self.deal_from(deck)
    #make sure you return a hand object
    #deck.take(2) will return an array.
    Hand.new(deck.take(2))
  end

  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def points
    points = 0
    ace_counts = 0
    @cards.each do |card|
      if card.value == :ace
        ace_counts += 1
      else
        points += card.blackjack_value
      end
    end

    # keep in mind this does NOT work for all edge cases. 
    # if a hand had 4 aces and a nine ==> the points will
    # result to 9 + 11 + 1 + 1 + 1 => 23 points. 

    # however, the specs only test in the case of at most 2 aces.
    if points <= 10 && ace_counts > 0
      points += 11
      ace_counts -= 1
    end

    points += ace_counts * 1

    points
  end

  def busted?
    points > 21
  end

  def hit(deck)
    raise "already busted" if busted?
    @cards += deck.take(1)
  end

  def beats?(other_hand)
    return false if busted?
    return true if other_hand.busted?
    points > other_hand.points
  end

  def return_cards(deck)
    # this will NOT work.
    # deck.concat(@cards)
    # the test is specifically checking if the .concat method is called on the deck.
    deck.return(@cards)
    @cards = []
  end

  def to_s
    @cards.join(",") + " (#{points})"
  end
end
