require_relative 'card'
# require 'byebug'

class Board
  CARD_SET = ("a".."z").to_a
  attr_accessor :board, :size

  def initialize(size)
    @size = size
    populate(@size)
  end

  def populate(size)
    @board = Array.new(size) { Array.new(size) }
    #card value Array
    #populate array w/ 2 of ech char till full
    #wrap if necessary
    #shuffle
    #call card inceremnts array index
    grid_size = size**2
    card_array = Array.new(grid_size)
    array_index = 0

    until array_index >= (card_array.length-1)
      2.times do
        card_array[array_index] = CARD_SET[(array_index/2)%26]
        array_index+=1
      end
    end
    card_array.shuffle!
    increment = 0

    @board.each_index do |idx|
      @board.each_index do |idx2|
        @board[idx][idx2] = Card.new(card_array[increment])
        increment+=1
      end
    end
  end

  def [](pos)
    row, col = pos
    @board[row][col]
  end

  def []=(pos, card)
    row, col = pos
    @board[row][col] = card
  end

  def render
    @board.each_index do |row|
      print "|"
      @board.each_index do |col|
        # debugger
        print(@board[row][col].face == :revealed ? @board[row][col] : "*")
        print "|"
      end
      puts
    end
  end

  def won?
    @board.each_index do |row|
      @board.each_index do |col|
        return false if @board[row][col].face == :hidden
      end
    end
    true
  end

  def reveal_guess(guess_pos)
    self[guess_pos].reveal
  end

  # def reveal_all
  #   @board.each_index do |row|
  #     @board.each_index do |col|
  #       @board[row][col].face = :revealed
  #     end
  #   end
  #   render
  #
  # end


end
