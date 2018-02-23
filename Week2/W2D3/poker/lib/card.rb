require 'card_constants'

class Card

  include CardConstants

  attr_reader :value, :suit

  def initialize(value, suit)
    raise "not a valid value" unless CARD_VALUES.include?(value)
    raise "not a valid suit" unless SUITS.include?(suit)
    @value = value
    @suit = suit
  end

  def <=>(other_card)
    CARD_VALUES[self.value] <=> CARD_VALUES[other_card.value]
  end


end
