require 'rspec'
require 'spec_helper'
require 'a01'

describe 'binary_search' do
  # create a method that performs a binary search in an array for
  # an element and returns its index
  let(:arr) { [11, 22, 33, 44, 66] }

  it "returns nil if the array is empty" do
    expect(binary_search([], 11)).to be_nil
  end

  it "returns the index of a target" do
    expect(binary_search(arr, 33)).to eq(2)
  end

  it "returns the index of a target that's less than the midpoint" do
    expect(binary_search(arr, 22)).to eq(1)
  end

  it "returns the index of a target that's greater than the midpoint" do
    expect(binary_search(arr, 66)).to eq(4)
  end

  it "returns nil if the target isn't found" do
    expect(binary_search(arr, 5)).to be_nil
  end

  it "does not call any blacklisted methods" do
    disallowed_methods = [
      :index, :find_index, :include?, :member?
    ]

    disallowed_methods.each do |method|
      expect(arr).not_to receive(method)
    end

    binary_search(arr, 5)
    binary_search(arr, 11)
  end

  it "calls itself recursively" do
    expect(self).to receive(:binary_search).exactly(3).times.and_call_original
    binary_search(arr, 11)
  end
end

describe "#two_sum" do
  # Write a new `Array#two_sum` method that determines whether
  # an array has positions where the elements at those positions
  # sum to zero.

  it "finds a matching pair" do
    expect([5, 1, -7, -5].two_sum).to eq(true)
  end

  it "works with multiple pairs" do
    expect([5, -1, -5, 1].two_sum).to eq(true)
  end

  it "works with multiple pairs for the same element" do
    expect([5, -5, -5].two_sum).to eq(true)
  end

  it "returns false when no pair is found" do
    expect([5, 5, 3, 1].two_sum).to eq(false)
  end

  it "won't find spurious zero pairs" do
    expect([0, 1, 2, 3].two_sum).to eq(false)
  end

  it "will find real zero pairs" do
    expect([0, 1, 2, 0].two_sum).to eq(true)
  end
end

describe "#fibs_rec" do
  # write a recursive implementation of a method that returns the
  # first `n` fibonacci numbers.

  it "returns first fibonacci number" do
    expect(fibs_rec(1)).to eq([0])
  end

  it "returns first two fib numbers" do
    expect(fibs_rec(2)).to eq([0, 1])
  end

  it "returns many fibonacci numbers" do
    expect(fibs_rec(6)).to eq([0, 1, 1, 2, 3, 5])
  end

  it "calls itself recursively" do
    expect(self).to receive(:fibs_rec).at_least(:twice).and_call_original
    fibs_rec(6)
  end
end

# This method returns true if the sentence passed as an argument
# can be created by rearranging the receiver.
describe "shuffled_sentence_detector" do
  it "can detect a shuffled sentence" do
    sentence1 = "the cat ate the rat"
    sentence2 = "the rat ate the cat"
    expect(sentence1.shuffled_sentence_detector(sentence2)).to eq(true)
  end

  it "doesn't return false positives" do
    sentence1 = "the cat ate the rat"
    sentence2 = "the rat ate a cat"
    expect(sentence1.shuffled_sentence_detector(sentence2)).to eq(false)
  end

  it "anagrams don't cause a false positive" do
    sentence1 = "the cat ate the rat"
    sentence2 = "tcatr hatha eteet"
    expect(sentence1.shuffled_sentence_detector(sentence2)).to eq(false)
  end

  it "partial matches don't cause a false positive" do
    sentence1 = "the cat ate the rat"
    sentence2 = "the rat ate cat"
    expect(sentence1.shuffled_sentence_detector(sentence2)).to eq(false)
  end
end

describe "#nth_prime" do
  # `nth_prime(n)` returns the nth prime number
  it "returns the first prime number" do
    expect(nth_prime(1)).to eq(2)
  end

  it "returns the fifth prime number" do
    expect(nth_prime(5)).to eq(11)
  end

  it "returns nil when asked for the zeroth prime" do
    expect(nth_prime(0)).to be_nil
  end
end

describe 'Array#my_each' do
  it 'calls the block passed to it' do
    expect do |block|
      ["test array"].my_each(&block)
    end.to yield_control.once
  end

  it 'yields each element to the block' do
    expect do |block|
      ["el1", "el2"].my_each(&block)
    end.to yield_successive_args("el1", "el2")
  end

  it 'does NOT call the Array#each or Array#map! method' do
    original_array = ["original array"]
    expect(original_array).not_to receive(:each)
    expect(original_array).not_to receive(:map!)
    original_array.my_each {}
  end

  it 'is chainable and returns the original array' do
    original_array = ["original array"]
    expect(original_array.my_each {}).to be(original_array)
  end
end

describe "Array#my_find" do
  it "calls the block passed to it" do
    expect do |block|
      ["test element"].my_find(&block)
    end.to yield_control
  end

  it "yields each element to the block" do
    test_array = ["el1", "el2", "el3"]
    expect do |block|
      test_array.my_find(&block)
    end.to yield_successive_args("el1", "el2", "el3")
  end

  it "returns nil if no element is found" do
    expect([2].my_find { |el| el.odd? }).to eq(nil)
  end

  it "returns the first element for which the block evaluates to true" do
    test_array = [1, 2, 3, 4, 5]
    expect(test_array.my_find(&:even?)).to eq(2)
    expect(test_array.my_find { |el| el > 3 }).to eq(4)
  end

  it "does NOT call the built in Array#find" do
    test_array = ["el1", "el2", "el3"]
    expect(test_array).not_to receive(:find)
    expect(test_array).not_to receive(:detect)
    test_array.my_find {}
  end
end

