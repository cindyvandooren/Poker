require 'rspec'
require 'card'

describe Card do
  # This went wrong at first, because there wasn't a
  # class present in the lib/card.rb file. Solution was
  # to use describe "Card"do, other solution is to add
  # class Card to lib/class.rb.

  describe "::suits" do
    it "includes all the possible suits" do
      expect(Card.suits).to include(:spades, :diamonds, :clovers, :hearts)
      # Apparently symbols can't be sorted. So, calling
      # suits, sorting it and then asking it to match_array
      # is not a good way of testing suits' functionality.
    end
  end

  describe "::values" do
    it "returns all the possible values" do
      expect(Card.values).to include(:one, :two, :three, :four, :five, :six, :seven, :eight, :nine, :ten, :jack, :queen, :king)
    end
  end

  subject(:new_card) { Card.new(:spades, :three) }

  describe "#initialize" do
    it "assigns the suit" do
      expect(new_card.suit).to eq(:spades)
    end

    it "assigns the value" do
      expect(new_card.value).to eq(:three)
    end

    it "does not accept suits that are not symbols" do
      expect(new_card.suit).to be_instance_of(Symbol)
    end

    it "does not accept values that are not symbols" do
      expect(new_card.value).to be_instance_of(Symbol)
    end
  end

  describe "#poker_value" do
    subject(:poker_card) { Card.new(:spades, :king) }

    it "returns the value of the card as an integer" do
      expect(poker_card.poker_value).to eq(12)
    end

    it "does not return the value of the card as a string" do
      expect(poker_card.poker_value).to_not eq('12')
    end
  end
end
