require 'exercises'

describe "#my_uniq" do
  subject(:dup_array) { [1,2,3,3,4,4,5] }

  it "returns an array" do
    expect(dup_array.my_uniq.is_a?(Array)).to be true
  end

  context "returns an array" do
    it "returns an array of unique elements" do
      expect(dup_array.my_uniq).to eq(dup_array.uniq)
    end

    it "returns an array of unique elements in the order they appeared" do
      expect(dup_array.my_uniq).to match_array(dup_array.uniq)
    end

    it "doesn't alter the original array" do
      expect(dup_array.my_uniq).not_to eql(dup_array)
    end
  end
end

describe "#two_sum" do
  subject(:array) { [-1, 0, 2, -2] }

  it "returns an array" do
    expect(array.two_sum.is_a?(Array)).to be true
  end

  it "returns the correct index pairs" do
    expect(array.two_sum).to eq([[2, 3]])
  end

  it "doesn't return a spurious pairs" do
    expect(array.two_sum).not_to include([1,1])
  end

  context "when there are no matching pairs" do
    subject(:array) { [-1, 2, 4, 5] }

    it "return an empty array" do
      expect(array.two_sum).to eq([])
    end
  end

  context "when there are multiple pairs" do
    subject(:array) {[-1, 0, 2, -2, 1, 3, -3, 0]}

    it "return pairs in the correct order" do
      expect(array.two_sum).to eq([[0, 4],[1, 7], [2, 3], [5, 6]])
    end
  end
end


describe "#my_transpose" do
  subject(:matrix) {[
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
  ]}

  it "returns an array" do
    expect(matrix.my_transpose).to be_an_instance_of(Array)
  end

  it "returns and array of the same length" do
    expect(matrix.my_transpose.size).to eq(matrix.size)
  end

  it "correctly transposes rows to columns" do
    expect(matrix.my_transpose).to match_array(matrix.transpose)
  end

  it "doesn't alter the original matrix" do
    expect(matrix.my_transpose).not_to eql(matrix)
  end

end


describe "stock_picker" do
  subject(:prices) { [1, 1, 5, 8, 3, 4] }

  it "raise an error if not passed an array" do
    expect{stock_picker("prices")}.to raise_error("Not an array!")
  end

  it "should be bought before sold" do
    expect(stock_picker(prices).first).to be <(stock_picker(prices).last)
  end

  it "returns the earliest pair of days" do
    expect(stock_picker(prices)).to eq([0, 3])
  end

  context "when there are no prices" do
    subject(:prices) { [] }

    it "raises an ArgumentError" do
      expect{stock_picker(prices)}.to raise_error(ArgumentError)
    end

  end


  context "when some prices are negative" do
    subject(:prices) { [1, -2, 3, 5] }

    it "ignores negative prices"  do
      expect{stock_picker(prices)}.not_to raise_error
    end

    it "correctly chooses most profitable pair" do
      expect(stock_picker(prices)).to eq([0,3])
    end
  end

  context "when all prices are negative" do
    subject(:prices) { [-1, -2, -5, -3] }

    it "returns an empty array" do
      expect(stock_picker(prices)).to be_empty
    end
  end

  context "when there is only one price" do
    subject(:prices) { [1] }

    it "raises a 'not enough prices' error" do
      expect{stock_picker(prices)}.to raise_error("Not enough prices")
    end
  end
end
