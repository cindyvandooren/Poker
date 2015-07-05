require 'rspec'
require 'card'
require 'deck'

describe Deck do
  describe "::all_cards" do
    subject(:all_cards) { Deck.all_cards }

    it "returns 52 cards" do
      expect(Deck.all_cards.count).to eq(52)
    end

    it "returns only unique cards" do
      deduped_cards = all_cards.map{ |card| [card.suit, card.value] }.uniq
      expect(deduped_cards.count).to eq(52)
      # This (expect(Deck.all_cards.uniq.count).to eq(52))
      # will not do what returns unique cards want to test
      # since every created card has a different object_id.
      # We need to test if there are no suits and values
      # that are the same.
    end

  end

  let(:set_cards) do
    [Card.new(:spades, :one),
     Card.new(:hearts, :two),
     Card.new(:diamonds, :four)
     ]
   end

  describe "#initialize" do
    it "initializes with 52 cards by default" do
      expect(Deck.new.cards.count).to eq(52)
    end

    it "can also take an array of cards" do
      expect(Deck.new(set_cards).cards.count).to eq(3)
    end
  end

  describe "#count" do
    it "returns 52 when the deck has 52 cards" do
      expect(Deck.new.count).to eq(52)
    end

    it "returns 3 when the deck has 3 cards" do
      expect(Deck.new(set_cards).count).to eq(3)
    end
  end

  describe "#shuffle" do
    subject(:all_cards) { Deck.all_cards }
    it "shuffles the cards randomly" do
      expect(all_cards.shuffle).to_not eq(all_cards)
    end
  end
end
