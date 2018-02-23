require 'rspec'
require 'towers_of_hanoi'

RSpec.describe TowersofHanoi do

  subject(:game) { TowersofHanoi.new }
  let(:setup){ [[3, 2, 1], [], []] }


  describe "#initialize" do
    it "initializes the tower instance variable to setup" do
      expect(game.towers).to eq(setup)
    end
  end

  describe "#move" do
    before(:each) { game.move(0, 1) }

    context "when larger piece is pushed onto smaller piece" do
      it "raises an error" do
        expect { game.move(0, 1)}.to raise_error("Can't move piece!")
      end
    end

    context "when smaller piece is pushed onto larger piece" do
      it "take top disc from start tower and move it to end tower" do
        expect(game.move(1, 0)).to eq(setup)
      end
    end
  end

  describe "#won?" do
    towers = TowersofHanoi.new([[], [3, 2, 1], []])

    it "the first tower is empty" do
      expect(towers.towers[0]).to be_empty
    end

    it "the second or third tower contains all discs in order" do
      expect(towers).to be_won
    end
  end

end
