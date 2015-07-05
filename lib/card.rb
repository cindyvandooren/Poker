class Card
  SUITS = [
            :spades,
            :diamonds,
            :clovers,
            :hearts
          ]

  VALUES = [
            :one,
            :two,
            :three,
            :four,
            :five,
            :six,
            :seven,
            :eight,
            :nine,
            :ten,
            :jack,
            :king,
            :queen
            ]

  def self.suits
    SUITS
  end

  def self.values
    VALUES
  end

  attr_reader :suit, :value

  def initialize(suit, value)
    @suit = suit
    @value = value
  end

end
