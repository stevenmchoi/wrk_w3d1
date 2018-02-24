class Player
  attr_reader :name, :bankroll
  attr_accessor :hand

  def initialize(name, bankroll)
    @name = name
    @bankroll = bankroll
  end
  
  def pay_winnings(bet_amt)
    @bankroll += bet_amt
  end
  
  def return_cards(deck)
    #yes, we did NOT initialize the player with a hand

    # based on this implementation of the game, the player will be assigned hand
    # after the player has been initialized


    hand.return_cards(deck)
    @hand = nil
  end

  def place_bet(dealer, bet_amt)
    raise "player can't cover bet" if bet_amt > @bankroll
    dealer.take_bet(self, bet_amt)
    @bankroll -= bet_amt
  end
end
