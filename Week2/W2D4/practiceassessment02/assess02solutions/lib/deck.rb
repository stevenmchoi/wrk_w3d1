require_relative 'card'

# Represents a deck of playing cards.
class Deck

  # Returns an array of all 52 playing cards.

  # keep in mind this is NOT a factory method.
  # factory methods are class methods that
  # return an instance of the class.

  # this method only returns an array of cards
  def self.all_cards

  end

  def initialize(cards)
  end

  # Returns the number of cards in the deck.
  def count
  end

  # Takes `n` cards from the top of the deck.
  def take(n)
  end

  # Returns an array of cards to the bottom of the deck.
  def return(cards)
  end

end
