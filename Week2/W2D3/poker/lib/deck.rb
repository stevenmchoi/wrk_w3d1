require 'card'
require 'card_constants'

class Deck

  include CardConstants

  attr_reader :cards

  def initialize
    @cards = Deck.make_generic_deck
  end

  def shuffle_cards
    self.cards.shuffle
  end

  def draw
    self.cards.pop
  end
  private

  def self.make_generic_deck
    deck_arr = Array.new
    CARD_VALUES.keys.each do |value|
      SUITS.each do |suit|
        deck_arr << Card.new(value, suit)
      end
    end
    deck_arr
  end



end
