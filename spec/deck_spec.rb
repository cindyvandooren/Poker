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

  subject(:small_deck) { Deck.new(set_cards) }

  let(:add_cards) do
    [Card.new(:spades, :one),
     Card.new(:hearts, :two),
     Card.new(:hearts, :three)
     ]
   end

  describe "#return(cards)" do
    it "adds the cards to the deck" do
      expect(small_deck.return(add_cards).count).to eq(6)
    end

    it "adds the cards to the back of the deck" do
      small_deck.return(add_cards)
      expect(small_deck.cards.last(3)).to match_array(add_cards)
    end

  end

  describe "#take(amount)" do
    let(:cards) do
       [ Card.new(:spades, :two),
         Card.new(:spades, :three),
         Card.new(:spades, :four),
         Card.new(:spades, :five),
         Card.new(:spades, :six),
         Card.new(:spades, :seven)
       ]
    end

    subject(:deck) { Deck.new(cards.dup) }

    it "takes the amount of cards from the front of the deck" do
      expect(deck.take(2)).to eq(cards[0..1])
    end

    it "raises error if the deck has not enough cards" do
      expect { deck.take(7) }.to raise_error("not enough cards in deck")
      # Apparently to make this test work, expect should
      # have a block to append the to raise_error to.
    end
  end
end
