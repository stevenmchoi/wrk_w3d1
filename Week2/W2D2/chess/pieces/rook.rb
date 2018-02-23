require_relative 'piece'
require_relative 'slidingpiece'

class Rook < Piece
  include SlidingPiece

  def initialize(color, board, pos)
    super
  end
  def symbol
    if color == "white"
      " \u2656 "
    else
      " \u265C "
    end
  end


  protected

  def move_dirs
    horizontal_dirs
  end
  # def moves(pos)
  #   move_set = []
  #   row, col = pos
  #
  #   (row..7).each {|r| move_set << [r, col]}
  #   (col..7).each {|c| move_set << [row, c]}
  #   (0...row).each {|r| move_set << [r, col]}
  #   (0...col).each {|c| move_set << [row, c]}
  #
  #   move_set
  # end


  #
  # protected
  #
    # def move_dirs
    #   {horizontalvert:true}
    # end
end
