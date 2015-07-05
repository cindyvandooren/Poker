require_relative 'card'

class Deck
  def self.all_cards
    all_cards = []

    Card.suits.each do |suit|
      Card.values.each do |value|
        all_cards << Card.new(suit, value)
      end
    end

    all_cards
  end

  attr_accessor :cards

  def initialize(cards = Deck.all_cards)
    @cards = cards
  end

  def count
    @cards.count
  end

  def shuffle
    @deck.cards.shuffle
  end

  def return(cards)
    @cards.concat(cards)
  end

  def take(amount)
    raise "not enough cards in deck" if amount > count
    @cards.shift(amount)
  end
end
