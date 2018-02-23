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
    until hand.points >= 17
      self.hand.hit(deck)
    end
  end

  def take_bet(player, amt)
    unless bets[player]
      bets[player] = amt
    else
      bets[player] += amt
    end

  end

  def pay_bets
    @bets.each do |player,bet|
      player.pay_winnings(bet*2) if player.hand.beats?(self.hand)
    end
  end
end
