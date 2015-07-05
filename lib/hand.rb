class Hand
  attr_accessor :cards

  def self.deal_from(deck)
    Hand.new(deck.take(5))
  end

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.count
  end

  def draw(deck, amount)
    raise "hand is too big" if @cards.count + amount > 5
    @cards.concat(deck.take(amount))
  end

  def return(deck, del_cards)
    raise "you can return up to three cards" if del_cards.count > 3
    remaining_cards = []
    @cards.each do |card|
      remaining_cards << card unless del_cards.include?(card)
    end

    @cards = remaining_cards

    deck.return(del_cards)
  end
end
