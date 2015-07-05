require 'rspec'
require 'player'

describe Player do
  let(:hand) { double("hand") }
  subject(:new_player) { Player.new(hand, 1000) }
  describe "#initialize" do
    it "returns a player with a hand and a pot" do
      expect(new_player.hand).to eq(hand)
      expect(new_player.pot).to eq(1000)
    end

  end

end
