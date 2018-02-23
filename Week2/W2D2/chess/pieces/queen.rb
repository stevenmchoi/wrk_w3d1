require_relative 'piece'
require_relative 'slidingpiece'

class Queen < Piece

  include SlidingPiece

  attr_accessor :color, :symbol

  def initialize(color, board, pos)
    super
  end

  def symbol
    if color == "white"
      " \u2655 "
    else
      " \u265B "
    end
  end

  protected

  def move_dirs
    horizontal_dirs + diagonal_dirs
  end

  # def moves(pos)
  #   move_set = []
  #
  #   row, col = pos
  #   while row >= 0 && col <= 7
  #     move_set << [row-1, col+1]
  #   end
  #   while row >= 0 && col >= 7
  #     move_set << [row-1, col-1]
  #   end
  #   while row <= 7 && col <= 7
  #     move_set << [row+1, col+1]
  #   end
  #   while row <= 7 && col >= 0
  #     move_set << [row+1, col-1]
  #   end
  #   (row..7).each { |r| move_set << [r, col] }
  #   (col..7).each { |c| move_set << [row, c] }
  #   (0...row).each { |r| move_set << [r, col] }
  #   (0...col).each { |c| move_set << [row, c] }
  #
  #   move_set.uniq
  # end


  #
  # protected
  #
  # def move_dirs
  #   {diagonal:true, horizontalvert:true}
  # end
end
