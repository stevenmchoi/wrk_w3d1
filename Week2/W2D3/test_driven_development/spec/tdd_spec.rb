require 'rspec'
require 'tdd'

RSpec.describe Array do

  describe "#my_uniq" do
    let(:arr) { [1, 2, 1, 3, 3] }

    it "returns an array" do
      expect(arr.my_uniq).to be_an_instance_of(Array)
    end

    it "does not call Array#uniq method" do
      expect(arr.my_uniq).to_not receive(:uniq)
    end

    it "does not contain duplicates" do
      expect(arr.my_uniq).to eq(arr.uniq)
    end
  end

  describe "#two_sum" do
    let(:sum_arr) { [-1, 0, 2, -2, 1] }
    let(:sums) { sum_arr.two_sum }

    it "subarrays contain only two values" do
      all_sums_have_length_two = sums.all? {|el| el.length == 2 }
      expect( all_sums_have_length_two ).to be true
    end

    it "sum of subarrays all equate to zero" do
      all_sums_equal_zero = sums.all?{ |f,s| sum_arr[f] + sum_arr[s] == 0 }
      expect( all_sums_equal_zero ).to eq true
    end

    it "smaller first elements come first" do
      expect(sums).to eq([[0,4], [2,3]])
    end
   end

   describe "#my_transpose" do
     let(:tranß) {[[0, 1, 2],[3, 4, 5],[6, 7, 8]]}
     let(:result) {[[0, 3, 6],[1, 4, 7],[2, 5, 8]]}

     it "transposes the array" do
       expect(my_transpose(tranß)).to eq(result)
     end

     it "doesn't change the length of original array" do
       expect(tranß[0].length).to eq (my_transpose(tranß).length)
     end

     it "only contains values from original array" do
       expect(tranß.flatten.sort).to eq(my_transpose(tranß).flatten.sort)
     end
   end

   describe "#stock_picker" do
     let(:stock_prices){ [50, 300, 20, 70, 30, 120]}

     it "returns a pair of two days" do
       expect(stock_picker(stock_prices).length).to eq(2)
     end

     it "returns the most profitable pair of days" do
       expect(stock_picker(stock_prices)).to eq([0,1])
     end
   end

end
