require_relative "card"

class Hand
  attr_reader :cards, :deck
  attr_accessor :points



  def initialize(deck)
    @deck = deck
    @cards = deck.take(5)
    @points = 0
  end

  def draw(amount)
    raise "not enough cards" if amount > 3
    @cards += deck.take(amount)
  end

  def return(cards)
    @deck.return(cards)
    @cards -= cards
  end

  def is_pair?
    #debugger
    card_values = @cards.map { |card| card.value }
    card_values.select{|value| card_values.count(value) == 2}.uniq.length > 0

  end

  def three_of_a_kind?
    #debugger
    card_values = @cards.map { |card| card.value }
    card_values.select{|value| card_values.count(value) == 3}.uniq.length > 0

  end

  def is_two_pair?
    #debugger
    card_values = @cards.map { |card| card.value }
    card_values.select{|value| card_values.count(value) == 2}.uniq.length > 0

  end

  def is_straight?
    #debugger
    card_values = @cards.map { |card| card.value }.map {|card| Card::NUMBER_VALUES[card]}.sort
    4.downto(0) do |idx|
      if idx != 0
        return false if card_values[idx] - 1 != card_values[idx - 1]
      end
    end
    true

  end

  def is_a_flush?
    card_suits = @cards.map{ |card| card.suit }
    card_suits.uniq.length == 1
  end

  def is_full_house?
    card_values = @cards.map { |card| card.value }
    (card_values.select{|value| card_values.count(value) == 3}.uniq.length == 1) &&\

    (card_values.select{|value| card_values.count(value) == 2}.uniq.length == 1)
  end

  def four_of_a_kind?
    card_values = @cards.map { |card| card.value }
    card_values.select{|value| card_values.count(value) == 4}.uniq.length == 1

  end

  def straight_flush?
    card_values = @cards.map { |card| card.value }.map {|card| Card::NUMBER_VALUES[card]}.sort
    4.downto(0) do |idx|
      if idx != 0
        return false if card_values[idx] - 1 != card_values[idx - 1]
      end
    end

    card_suits = @cards.map{ |card| card.suit }
    card_suits.uniq.length == 1


  end

  def calculate_points
    if straight_flush?
      return 12
    elsif four_of_a_kind?
      return 11
    elsif is_full_house?
      return 10
    elsif is_a_flush?
      return 9
    elsif is_straight?
      return 8
    elsif is_two_pair?
      return 7
    elsif three_of_a_kind?
      return 6
    elsif is_pair?
      return 5
    else
      return 4
    end

  end

  def beats?(other_hand)
    self.calculate_points > other_hand.calculate_points
  end

end
