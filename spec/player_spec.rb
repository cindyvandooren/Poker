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
      new_player.get_hand(hand)
      expect(new_player.hand).to eq(hand)
    end
  end

  describe "#take_bet" do
    it "should decrease the players pot by the amount" do
      expect do
        new_player.take_bet(100)
      end.to change { new_player.pot }.by(-100)
    end

    it "does not allow bet to be higher than amount in pot" do
      expect do
        new_player.take_bet(2000)
      end.to raise_error("bet can't be higher than pot")
    end
  end

   describe "#get_winnings" do
     it "should increase the players bankroll with the winnings" do
       expect do
         new_player.get_winnings(100)
       end.to change { new_player.pot }.by(100)
     end
  end

end
