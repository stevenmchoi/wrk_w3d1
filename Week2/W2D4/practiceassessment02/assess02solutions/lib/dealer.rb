require_relative 'player'

class Dealer < Player
  attr_reader :bets

  def initialize
    super("dealer", 0)

    @bets = {}
  end

  def place_bet(dealer, amt)
    raise "Dealer doesn't bet"
  end

  def play_hand(deck)

    # make sure you loop through to potentially call hand.hit multiple times.
    until self.hand.points >= 17
      
      # this is the same as saying @hand.hit(deck)
      self.hand.hit(deck)

    end
  end

  def take_bet(player, amt)
    @bets[player] = amt
  end

  def pay_bets
    @bets.each do |player, amt|
      player.pay_winnings(amt*2) if player.hand.beats?(self.hand)
    end
  end
end
