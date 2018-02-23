require 'deck'


class Hand

  attr_reader :hand_of_cards

  def initialize
    @hand_of_cards = Array.draw_initial_hand
  end

  private
  def self.draw_initial_hand
    cards = []

    5.times do { cards << ___.draw }

    cards
  end

end
