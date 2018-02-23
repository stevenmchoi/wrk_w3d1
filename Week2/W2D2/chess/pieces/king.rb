require_relative 'piece'
require_relative 'steppingpiece'


class King < Piece

  include SteppingPiece

  def initialize(color, board, pos)
    super
  end

  def symbol
    if color == "white"
      " \u2654 "
    else
      " \u265A "
    end
  end
  # def moves(pos)
  #   row, col = pos
  #   [[row-1, col+1][row, col+1][row+1, col+1][row+1, col][row+1, col-1][row, col-1][row-1, col-1][row-1, col]]
  # end

  # def initialize
  #   super
  # end
  #

  #
  protected

  def move_diffs
    [[-1, 0], [-1, 1], [0, 1], [1, 1], [1, 0], [0, -1], [-1, 0], [-1, -1]]
  end
end
