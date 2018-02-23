require_relative 'piece'
require_relative 'slidingpiece'

class Bishop < Piece

  include SlidingPiece

  def initialize(color, board, pos)
    super(color, board, pos)
  end

  def symbol
    if color == "white"
      " \u2657 "
    else
      " \u265D "
    end
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
  #   move_set
  # end

  protected

  def move_dirs
    diagonal_dirs
  end






end
