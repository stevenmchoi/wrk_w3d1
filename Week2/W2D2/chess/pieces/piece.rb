class Piece
  attr_reader :color, :board, :pos

  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end

  def move_dirs
    raise 'Not Implemented'
  end


  # def valid_moves
  # end
  # def to_s
  # end
  # def empty?”’
  # end

  # def pos=(val)
  # end
  # def symbol
  # end
  #
  # private
  # def move_into_check?(end_pos)
  # end
end
