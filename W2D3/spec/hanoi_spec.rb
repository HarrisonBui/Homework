require 'hanoi'

describe Hanoi do
  describe "#move" do
    subject(:game) {Hanoi.new}
    it "needs to accept two numbers between 0..2" do
    end

    context "when player tries to move bigger block onto smaller block" do
      it "raises ArgumentError" do
        game.move(0,1)
        expect{ game.move(0,1) }.to raise_error(ArgumentError)
      end
    end

    context "when valid moves are entered" do
      before(:each) {game.move(0,1)}
      it "should remove a disk from selected tower" do
        expect(game.towers.first).to eq([3,2])
      end

      it "should add a disk to tower" do
        expect(game.towers[1]).to eq([1])
      end

      it "should call render" do
        expect(game).to receive(:render)
        game.move(1, 2)
      end
    end
  end

  describe "#won?" do
    subject(:game) {Hanoi.new}

    context "when won" do
      before(:each) do
        game.move(0,1)
        game.move(0,2)
        game.move(1,2)
        game.move(0,1)
        game.move(2,0)
        game.move(2,1)
        game.move(0,1)
      end

      it "checks that tower 1 is empty" do
        expect(game.towers.first).to be_empty
        # expect(game).to receive(:towers)
      end

      it "should return true" do
        expect(game.won?).to be true
      end
    end

    context "when not won" do
      it "should return false" do
        expect(game.won?).to be false
      end
    end
  end
end
