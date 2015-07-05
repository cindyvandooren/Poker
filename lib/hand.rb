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

  def high_card?
    highs = [:one, :jack, :king, :queen]

    @cards.each do |card|
      return true if highs.include?(card.value)
    end

    false
  end

  def one_pair?
    poker_values = @cards.map { |card| card.poker_value }
    poker_values.select { |value| poker_values.count(value) == 2 }.uniq.count == 1
  end

  def two_pairs?
    poker_values = @cards.map { |card| card.poker_value }
    poker_values.select { |value| poker_values.count(value) == 2 }.uniq.count == 2
  end

  def three_of_kind?
    poker_values = @cards.map { |card| card.poker_value }
    poker_values.select { |value| poker_values.count(value) == 3}.uniq.count == 1
  end

  def straight?
    poker_values = @cards.map { |card| card.poker_value }.uniq.sort

    return false if poker_values.count < 5

    (1...poker_values.length).each do |index|
      return false if poker_values[index] - poker_values[index - 1] != 1
    end

    true
  end

  def flush?
    @cards.map { |card| card.suit }.uniq.length == 1
  end

  def full_house?
    three_of_kind? && one_pair?
  end

  def four_of_kind?
    poker_values = @cards.map { |card| card.poker_value }
    poker_values.select { |value| poker_values.count(value) == 4 }.uniq.count == 1
  end

  def straight_flush?
    straight? && flush?
  end

  def points
    case
    when straight_flush?
      9
    when four_of_kind?
      8
    when full_house?
      7
    when flush?
      6
    when straight?
      5
    when three_of_kind?
      4
    when two_pairs?
      3
    when one_pair?
      2
    when high_card?
      1
    else
      0
    end
  end
end
