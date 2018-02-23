require 'rspec'
require 'hand'

RSpec.describe Hand do
  let(:hand) { Hand.new }

  describe "#initialize" do
    it "initializes with a hand of 5 cards" do
      expect(hand.hand_of_cards.length).to eq(5)
    end
  end
end
