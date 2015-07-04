require 'rspec'
require 'deck'
require 'byebug'

describe Deck do

   describe "::all_cards" do
    subject(:all_cards) { Deck.all_cards }

     it "starts with a count of 52" do
       expect(all_cards.count).to eq(52)
     end

     it "returns all cards without duplicates" do
       deduped_cards = all_cards
         .map { |card| [card.suit, card.value] }
         .uniq
         .count
       expect(deduped_cards).to eq(52)
     end
   end

  describe "#initialize" do
    it "starts with 52 unique cards" do
      deck = Deck.new
      expect(deck.cards.count).to eq(52)
    end

  end

  describe "#shuffle" do
    subject(:all_cards) { Deck.all_cards }
    it "shuffles the deck" do
        expect(all_cards.shuffle).to_not eq(all_cards)
    end

  end


  describe "#take" do
    let(:cards) do
      cards = [ Card.new(:spades, :two),
        Card.new(:spades, :three),
        Card.new(:spades, :four),
        Card.new(:spades, :five),
        Card.new(:spades, :six),
        Card.new(:spades, :seven) ]
    end

    subject(:deck) { Deck.new(cards.dup) }
    it "takes cards off the top of the deck" do
      #debugger
      expect(deck.take(1)).to eq(cards[0..0])
      expect(deck.take(2)).to eq(cards[1..2])
    end

    it "removes cards from deck on take" do
      deck.take(2)
      expect(deck.cards.count).to eq(4)
      #expect(deck.count).to eq(1)
    end

    it "doesn't allow you to take more cards than are in the deck" do
      expect do
        deck.take(51)
      end.to raise_error("not enough cards")
    end

   end

   describe "#return" do
     let(:cards) do
       cards = [ Card.new(:spades, :two),
         Card.new(:spades, :three),
         Card.new(:spades, :four),
         Card.new(:spades, :five),
         Card.new(:spades, :six),
         Card.new(:spades, :seven) ]
     end
      subject(:deck) { Deck.new(cards.dup) }
     it "should take a certain amount of cards to the deck" do
       deck.return(cards)
       expect(deck.cards.count).to eq(12)
     end






   end



end
