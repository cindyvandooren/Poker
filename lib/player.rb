class Player
  attr_reader :hand, :pot

  def initialize(pot)
    @pot = pot
  end

  def get_hand(hand)
    @hand = hand
  end

  def prompt_user
  end
end
