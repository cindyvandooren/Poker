require 'rspec'
require 'hand'
require 'card'

describe Hand do
  describe "::deal_from" do
    it "deals a hand of 5 cards" do
      deck_cards = [
                      Card.new(:spades, :one),
                      Card.new(:spades, :two),
                      Card.new(:spades, :three),
                      Card.new(:spades, :four),
                      Card.new(:spades, :five)
                    ]

      deck = double("deck")
      expect(deck).to receive(:take).with(5).and_return(deck_cards)

      hand = Hand.deal_from(deck)
      expect(hand.cards).to match_array(deck_cards)
    end
  end

  describe "#count" do
    it "counts the number of cards in the hand correctly" do
      expect(hand.count).to eq(5)
    end

    subject(:empty_hand) { Hand.new(deck) }

    it "returns 0 if there are no cards in the hand" do
      empty_hand.cards = []
      expect(empty_hand.count).to eq(0)
    end
  end

  let(:new_deck) { double("new_deck", take: new_cards) }

  let(:new_cards) do
    [ Card.new(:spades, :two),
      Card.new(:spades, :three),
      Card.new(:spades, :four),
      Card.new(:spades, :five),
      Card.new(:spades, :six),
      Card.new(:spades, :seven),
      Card.new(:spades, :eight)
    ]
  end

  subject(:new_hand) { Hand.new(new_deck) }

  describe "#draw(amount)" do
    it "it adds 5 cards from the deck to the hand" do
      allow(new_deck).to receive(:take).with(5).and_return(new_cards[0..4])
      new_hand.cards = []
      new_hand.draw(5)
      expect(new_hand.count).to eq(5)
    end

    it "raises an error when hand grows bigger than 5 when drawing" do
      allow(new_deck).to receive(:take).with(6).and_return(new_cards[0..5])
      new_hand.cards = []
      expect{ new_hand.draw(6) }.to raise_error("hand is too big")
    end
  end

  describe "#return(cards)" do
    xit "decreases the hand with a number of cards" do

    end

    xit "returns the indicated cards" do

    end

    xit "returns the cards to the deck" do
    end

    xit "raises an error when more than 3 cards are returned" do

    end


  end
end
