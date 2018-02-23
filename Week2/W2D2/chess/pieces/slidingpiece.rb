require 'byebug'

module SlidingPiece

  def horizontal_dirs
    HORIZONTAL_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIRS
  end

  def moves
    moves = []

    move_dirs.each do |(dx, dy)|
      moves.concat(grow_unblocked_moves_in_dir(dx, dy))
    end

    moves
  end

  private
  def move_dirs
    raise 'Not Implemented'
  end

  def grow_unblocked_moves_in_dir(dx, dy)
    dir_moves = []
    current_move = [pos[0] + dx, pos[1] + dy]

    while board.valid_pos?(current_move)
      dir_moves << current_move
      current_move = [current_move[0] + dx, current_move[1] + dy]
    end

    dir_moves
  end

  # def moves(piece_obj)
  #
  #   move_type = piece_obj.move_dirs
  #   move_set = []
  #   row, col = piece_obj.pos
  #
  #   if :horizontalvert
  #     (row..7).each {|r| move_set << [r, col]}
  #     (col..7).each {|c| move_set << [row, c]}
  #     (0...row).each {|r| move_set << [r, col]}
  #     (0...col).each {|c| move_set << [row, c]}
  #   elsif :diagonal
  #     while row >= 0 && col <= 7
  #       move_set << [row-1, col+1]
  #     end
  #     while row >= 0 && col >= 7
  #       move_set << [row-1, col-1]
  #     end
  #     while row <= 7 && col <= 7
  #       move_set << [row+1, col+1]
  #     end
  #     while row <= 7 && col >= 0
  #       move_set << [row+1, col-1]
  #     end
  #   elsif :horizontalvert && :diagonal
  #     (row..7).each {|r| move_set << [r, col]}
  #     (col..7).each {|c| move_set << [row, c]}
  #     (0...row).each {|r| move_set << [r, col]}
  #     (0...col).each {|c| move_set << [row, c]}
  #     while row >= 0 && col <= 7
  #       move_set << [row-1, col+1]
  #     end
  #     while row >= 0 && col >= 7
  #       move_set << [row-1, col-1]
  #     end
  #     while row <= 7 && col <= 7
  #       move_set << [row+1, col+1]
  #     end
  #     while row <= 7 && col >= 0
  #       move_set << [row+1, col-1]
  #     end
  #
  #   end
  #   move_set
  # end

  private

  HORIZONTAL_DIRS = [[1, 0], [-1, 0], [0, 1], [0, -1]]
  DIAGONAL_DIRS = [[1, -1], [-1, 1], [-1, -1], [1, 1]]
end
