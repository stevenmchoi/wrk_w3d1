require_relative 'piece'

class Pawn < Piece

  def initialize(color, board, pos)
    super
  end

  def symbol
    if color == "white"
      " \u2659 "
    else
      " \u265F "
    end
  end

  def move_dirs
  end

  # private
  #
  # def at_start_row?
  # end
  #
  # def forward_dir #returns 1 or -1
  #
  # end
  #
  # def forward_steps
  #
  # end
  #
  # def side_attacks
  #
  # end
end
