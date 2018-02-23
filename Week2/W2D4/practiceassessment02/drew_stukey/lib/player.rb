require_relative 'hand'

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
    hand.return_cards(deck)
    @hand = nil
  end

  def place_bet(dealer, bet_amt)
    raise "player can't cover bet" if bet_amt > bankroll
    dealer.take_bet(self, bet_amt)
    @bankroll -= bet_amt

  end
  # it "enforces limits" do
  #   expect do
  #     player.place_bet(dealer, 1_000_000)
  #   end.to raise_error("player can't cover bet")
  # end
  # it "deducts bet from bankroll" do
  #   player.place_bet(dealer, 10_000)
  #   expect(player.bankroll).to eq(190_000)
  # end
end
