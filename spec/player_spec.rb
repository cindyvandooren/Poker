require 'rspec'
require 'player'

describe Player do
  subject(:new_player) { Player.new(1000) }

  describe "#initialize" do
    it "returns a player with a pot" do
      expect(new_player.pot).to eq(1000)
    end
  end

  describe "#get_hand" do
    let(:hand) { double("hand") }

    it "should set the players hand" do
      player.get_hand(hand)
      expect(player.hand).to eq(hand)
    end
  end



end
