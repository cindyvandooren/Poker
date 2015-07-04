require 'rspec'
require 'hand'
require 'byebug'
require 'card'


describe Hand do
  let(:deck) { double("deck", take: cards) }
  # allow(deck).to receive(:take).with(5).and_return(cards)

  let(:cards) do
      [ Card.new(:spades, :two),
      Card.new(:spades, :three),
      Card.new(:spades, :four),
      Card.new(:spades, :five),
      Card.new(:spades, :six) ]
   end
   subject(:hand) { Hand.new(deck) }

   describe "#initialize" do
      it "initializes with 5 cards" do
        expect(hand.cards.count).to eq(5)

      end

    end

    describe "#draw" do
      it "draws 3 cards from the deck" do
        allow(deck).to receive(:take).with(3).and_return(cards[0..2])
        hand.draw(3)
        expect(hand.cards.count).to eq(8)
      end

      it "raises an error when you draw more than 3 cards" do
        expect do
          #allow(deck).to receive(:take).with(10).and_return(cards[0..10])
          hand.draw(4)
        end.to raise_error("not enough cards")

      end
    end

    describe "#return" do
      it "should return cards back to the deck" do
        allow(deck).to receive(:return).with(cards[0..2])
        hand.return(cards[0..2])
        expect(hand.cards.count).to eq(2)
      end
    end

    let(:new_cards) do
        [ Card.new(:spades, :two),
        Card.new(:hearts, :two),
        Card.new(:spades, :four),
        Card.new(:hearts, :four),
        Card.new(:clovers, :four) ]
     end
    let(:new_deck) { double("deck", take: new_cards) }
    let(:new_hand) { Hand.new(new_deck) }
     describe "#is_pair?" do
       #debugger
       it "should return true if a pair" do
         expect(new_hand.is_pair?).to be_truthy
       end
     end

      describe "#three_of_a_kind?" do
        it "should return true if three of a kind" do
          expect(new_hand.three_of_a_kind?).to be_truthy
        end
      end

      describe "#is_two_pair?" do
        it "should return true if two pairs" do
          expect(new_hand.is_two_pair?).to be_truthy
        end
      end

      describe "#is_straight?" do
        let(:new_cards) do
            [ Card.new(:spades, :two),
            Card.new(:hearts, :three),
            Card.new(:spades, :four),
            Card.new(:hearts, :five),
            Card.new(:clovers, :six) ]
         end
         let(:new_deck) { double("deck", take: new_cards) }
         let(:new_hand) { Hand.new(new_deck) }
         it "should return true if it's straight?" do
             expect(new_hand.is_straight?).to be_truthy
         end

      end

      describe "is_a_flush?" do
        let(:new_cards) do
            [ Card.new(:spades, :two),
            Card.new(:spades, :three),
            Card.new(:spades, :four),
            Card.new(:spades, :five),
            Card.new(:spades, :six) ]
         end
         let(:new_deck) { double("deck", take: new_cards) }
         let(:new_hand) { Hand.new(new_deck) }
         it "should return true if its a flush?" do
             expect(new_hand.is_a_flush?).to be_truthy
         end

      end

      describe "#is_full_house?" do
        let(:new_cards) do
            [ Card.new(:spades, :two),
            Card.new(:hearts, :two),
            Card.new(:clovers, :two),
            Card.new(:hearts, :five),
            Card.new(:spades, :five) ]
         end
         let(:new_deck) { double("deck", take: new_cards) }
         let(:new_hand) { Hand.new(new_deck) }
         it "should return true if its a full house?" do
             expect(new_hand.is_full_house?).to be_truthy
         end

      end

      describe "four_of_a_kind?" do
        let(:new_cards) do
            [ Card.new(:spades, :two),
            Card.new(:hearts, :two),
            Card.new(:clovers, :two),
            Card.new(:diamond, :two),
            Card.new(:spades, :five) ]
         end
         let(:new_deck) { double("deck", take: new_cards) }
         let(:new_hand) { Hand.new(new_deck) }
         it "should return true if its a four of a kind?" do
             expect(new_hand.four_of_a_kind?).to be_truthy
         end
      end

      describe "straight_flush?" do
        let(:new_cards) do
            [ Card.new(:hearts, :two),
            Card.new(:hearts, :three),
            Card.new(:hearts, :four),
            Card.new(:hearts, :five),
            Card.new(:hearts, :six) ]
         end
         let(:new_deck) { double("deck", take: new_cards) }
         let(:new_hand) { Hand.new(new_deck) }
         it "should return true if its a straight_flush?" do
             expect(new_hand.straight_flush?).to be_truthy
         end

      end

      describe "#beats?" do
         let(:first_cards) do
            [ Card.new(:spades, :two),
            Card.new(:hearts, :two),
            Card.new(:clovers, :two),
            Card.new(:diamond, :two),
            Card.new(:spades, :five) ]
         end

         let(:first_deck) { double("deck", take: first_cards) }
         let(:first_hand) { Hand.new(first_deck) }

         let(:second_cards) do
             [ Card.new(:spades, :two),
             Card.new(:hearts, :two),
             Card.new(:clovers, :three),
             Card.new(:diamond, :six),
             Card.new(:spades, :five) ]
          end

          let(:second_deck) { double("deck", take: second_cards) }
          let(:second_hand) { Hand.new(second_deck) }

          it "should expect the hand with better cards to win?" do
            expect(first_hand.beats?(second_hand)).to be_truthy

          end

      end





end
