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
    new_cards = [
                  Card.new(:hearts, :one),
                  Card.new(:hearts, :two),
                  Card.new(:hearts, :three),
                  Card.new(:hearts, :four),
                  Card.new(:hearts, :five)
                ]

    subject(:new_hand) { Hand.new(new_cards) }

    it "counts the number of cards in the hand correctly" do
      expect(new_hand.count).to eq(5)
    end

    no_cards = []

    subject(:empty_hand) { Hand.new(no_cards) }

    it "returns 0 if there are no cards in the hand" do
      empty_hand.cards = []
      expect(empty_hand.count).to eq(0)
    end
  end

  let(:new_deck) { double("new_deck") }

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

  describe "#draw(deck, amount)" do
    it "it adds 5 cards from the deck to the hand" do
      expect(new_deck).to receive(:take).with(5).and_return(new_cards[0..4])
      new_hand.cards = []
      new_hand.draw(new_deck, 5)
      expect(new_hand.count).to eq(5)
    end

    it "raises an error when hand grows bigger than 5 when drawing" do
      allow(new_deck).to receive(:take).with(6).and_return(new_cards[0..5])
      new_hand.cards = []
      expect{ new_hand.draw(new_deck, 6) }.to raise_error("hand is too big")
    end
  end

  describe "#return(deck, cards)" do
    let(:return_deck) { double("return_deck")}

    new_set = [
                Card.new(:diamonds, :one),
                Card.new(:diamonds, :two),
                Card.new(:diamonds, :three),
                Card.new(:diamonds, :four),
                Card.new(:diamonds, :five)
              ]

    subject(:hand_to_return) { Hand.new(new_set) }


    it "decreases the hand with a number of cards" do
      allow(return_deck).to receive(:return).with(new_set[0..2])
      hand_to_return.return(return_deck, new_set[0..2])
      expect(hand_to_return.count).to eq(2)
    end

    it "returns the indicated cards" do
      allow(return_deck).to receive(:return).with(new_set[0..2])
      hand_to_return.return(return_deck, new_set[0..2])
      expect(hand_to_return.cards).to match_array(new_set[3..4])
    end

    it "returns the cards to the deck" do
      expect(return_deck).to receive(:return).with(new_set[0..2])
      hand_to_return.return(return_deck, new_set[0..2])
    end

    it "raises an error when more than 3 cards are returned" do
      allow(return_deck).to receive(:return).with(new_set[0..4])
      expect { hand_to_return.return(return_deck, new_set[0..4]) }.to raise_error("you can return up to three cards")
    end
  end
end
