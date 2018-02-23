require 'rspec'
require 'card'

RSpec.describe Card do

  subject(:new_card){ Card.new(:five, :hearts)}

  describe '#initialize' do
    it 'assigns a value' do
      expect(new_card.value).to eq(:five)
    end

    it 'assigns a suit' do
      expect(new_card.suit).to eq(:hearts)
    end

    it 'raises an error with invalid value' do
      expect { Card.new(:hi, :hearts)}.to raise_error("not a valid value")
    end

    it 'raises an error with invalid suit' do
      expect{ Card.new(:five, :hello)}.to raise_error("not a valid suit")
    end
  end

  describe '#<=>' do
    let(:card_one) { Card.new(:queen, :spades)}
    let(:card_two) { Card.new(:king, :hearts)}
    let(:card_three) { Card.new(:queen, :hearts)}

    context "first card's value is less than second card's" do
      it "returns -1" do
        expect(card_one.<=>(card_two)).to eq(-1)
      end
    end
    context "first card's value is equal to second card's" do
      it "returns 0" do
        expect(card_one.<=>(card_three)).to eq(0)
      end
    end
    context "first card's value is greater than second card's" do
      it "returns 1" do
        expect(card_two.<=>(card_one)).to eq(1)
      end
    end
  end

end
