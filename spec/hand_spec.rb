require 'rspec'
require 'hand'
require 'card'

describe Hand do
  let(:deck) { double("deck", take: cards) }

  let(:cards) do
    [ Card.new(:spades, :two),
      Card.new(:spades, :three),
      Card.new(:spades, :four),
      Card.new(:spades, :five),
      Card.new(:spades, :six)
    ]
  end

  subject(:hand) { Hand.new(deck) }

  describe "#initialize" do
    it "takes 5 cards from the deck" do
      expect(hand.cards.count).to eq(5)
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

  # describe "#draw(amount)" do
  #   it "draws 3 cards from the deck" do
  #
  #
  #   end
  #
  #   it "raises an error when hand grows bigger than 5 when drawing" do
  #
  #   end



end
