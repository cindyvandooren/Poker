require 'rspec'
require 'card'

describe Card do
  subject(:default_card) { Card.new(:spades, :one) }
  describe "#initialize" do

    it "initializes with a suit and value" do
        expect(default_card.suit).to eq(:spades)
        expect(default_card.value).to eq(:one)

    end

    it "doesn't initialize value with numbers" do
        expect(default_card.value).to_not eq(1)
    end
  end

  describe "::suits" do
    it "returns all the suits" do
      expect(Card.suits).to match_array([ :spades, :hearts, :clover, :diamond])
    end
  end

  describe "::values" do
    it "returns all the values" do
      expect(Card.values).to match_array([ :two, :three, :four, :five,
          :six, :seven, :eight, :nine, :ten,
          :jack, :queen, :king, :ace ])
    end
  end

end
