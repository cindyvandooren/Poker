class Card
  attr_reader :suit, :value

  def self.suits
    SUITS
  end

  def self.values
    VALUES
  end

  

  SUITS = [ :spades, :hearts, :clover, :diamond]
  VALUES = [:two, :three, :four, :five,
      :six, :seven, :eight, :nine, :ten,
      :jack, :queen, :king, :ace ]

  NUMBER_VALUES = {:two => 2, :three => 3, :four => 4, :five => 5,
      :six => 6, :seven => 7, :eight => 8, :nine => 9, :ten => 10,
      :jack => 11, :queen => 12, :king => 13, :ace => 14 }

  def initialize(suit, value)
    @suit = suit
    @value = value
  end




end
