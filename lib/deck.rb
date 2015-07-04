require_relative 'card'


class Deck
  attr_reader :cards

  def self.all_cards
    card_array = []
    Card.suits.each do |suit|
      Card.values.each do |value|
        card_array << Card.new(suit,value)
      end
    end
    card_array
  end

  def initialize(cards = Deck.all_cards)
    @cards = cards
  end

  def take(amount)
      raise "not enough cards" if amount > @cards.count
      cards.shift(amount)
  end

  def return(cards)
    @cards.concat(cards)
  end


end

d = Deck.new
p d.take(1)
