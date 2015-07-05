class Player
  attr_reader :hand, :pot

  def initialize(hand = Hand.from_deck, pot)
    @hand = hand
    @pot = pot
  end
end
