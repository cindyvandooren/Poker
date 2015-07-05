require 'deck'

class Hand
  attr_accessor :cards
  attr_reader :deck

  def initialize(deck)
    @deck = deck
    @cards = deck.take(5)
  end

  def count
    @cards.count
  end

  def draw(amount)
    raise "hand is too big" if @cards.count + amount > 5
    @cards.concat(deck.take(amount))
  end
end
