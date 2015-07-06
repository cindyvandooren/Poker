class Player
  attr_reader :hand, :pot

  def initialize(pot)
    @pot = pot
  end

  def get_hand(hand)
    @hand = hand
  end

  def take_bet(amount)
    raise "bet can't be higher than pot" if amount > pot
    @pot -= amount
    amount
  end

  def get_winnings(amount)
    @pot += amount
  end
end
