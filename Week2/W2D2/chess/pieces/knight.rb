require_relative 'piece'
require_relative 'steppingpiece'

class Knight < Piece

  include SteppingPiece

  def initialize(color, board, pos)
    super
  end

  def symbol
      if color == "white"
        " \u2658 "
      else
        " \u265E "
      end
  end

  protected

  def move_diffs
    [[-3, 1], [-3, -1], [3, -1], [3, 1], [-1, -3], [1, -3], [-1, 3], [1, 3]]
  end





# def moves(pos)
#
#   move_set = []
#   #bottom
#    move_set << [pos[0] + 3, pos[1] - 1]
#    move_set << [pos[0] + 3, pos[1] + 1]
#
#    ##top
#    move_set << [pos[0] - 3, pos[1] - 1]
#    move_set << [pos[0] - 3, pos[1] + 1]
#
#    #Right
#    move_set << [pos[0] + 1, pos[1] + 3]
#    move_set << [pos[0] - 1, pos[1] + 3]
#
#    #Left
#    move_set << [pos[0] + 1, pos[1] - 3]
#    move_set << [pos[0] - 1, pos[1] - 3]
#
#   move_set
#
# end
#   protected
#
#   def move_diffs
#   end
end
