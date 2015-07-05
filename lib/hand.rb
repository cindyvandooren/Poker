require 'deck'

class Hand
  attr_accessor :cards

  def initialize(deck)
    @deck = deck
    @cards = deck.take(5)
  end

  def count
    @cards.count
  end
end
