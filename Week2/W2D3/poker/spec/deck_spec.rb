require 'rspec'
require 'deck'

RSpec.describe Deck do

  subject(:new_deck){ Deck.new }

  describe '#initialize' do
    it 'creates a deck of 52 cards' do
      expect(new_deck.cards.length).to eq(52)
    end

    it 'assigns each card with unique values and symbols' do
      (expect(new_deck.cards.uniq.length)).to eq(52)
    end
  end

  describe '#shuffle_cards' do
    let(:shuffled_deck) { Deck.new }
    it 'shuffles the deck' do
      expect(shuffled_deck.shuffle_cards).not_to eq(new_deck)
    end
  end

  describe '#draw' do
    it 'draws a single card' do
      expect(new_deck.draw).to be_an_instance_of(Card)
    end
    it 'draws a card from the deck' do
      new_deck.draw
      expect(new_deck.cards.length).to eq(51)
    end
  end

end
