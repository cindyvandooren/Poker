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

  POKER_VALUES = {
                  :one => 1,
                  :two => 2,
                  :three => 3,
                  :four => 4,
                  :five => 5,
                  :six => 6,
                  :seven => 7,
                  :eight => 8,
                  :nine => 9,
                  :ten => 10,
                  :jack => 11,
                  :king => 12,
                  :queen => 13
                }

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

  def poker_value
    POKER_VALUES[value]
  end

end
