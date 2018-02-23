require_relative 'pieces/piece'
require_relative 'pieces/rook'
require_relative 'pieces/bishop'
require_relative 'pieces/knight'
require_relative 'pieces/queen'
require_relative 'pieces/king'
require_relative 'pieces/pawn'
require_relative 'pieces/nullpiece'

class Board
  attr_reader :rows

  def initialize
    @rows = Board.chess_board


  end

  def self.generic_board
    board_row = Array.new(8) { Array.new(8) }
    board_row[0].map! {|place| Piece.new("white", self, [0, place]) }
    board_row[1].map! {|place| Piece.new("white", self, [1, place]) }
    board_row[2].map! {|place| NullPiece.instance }
    board_row[3].map! {|place| NullPiece.instance }
    board_row[4].map! {|place| NullPiece.instance }
    board_row[5].map! {|place| NullPiece.instance }
    board_row[6].map! {|place| Piece.new("black", board_row, [6, place]) }
    board_row[7].map! {|place| Piece.new("black", board_row, [7, place]) }
    board_row
  end

  def self.chess_board
    board_row = Array.new(8) { Array.new(8) }
    board_row[0][0] = Rook.new("white", self, [0,0])
    board_row[0][7] = Rook.new("white", self, [0,7])
    board_row[0][1] = Knight.new("white", self, [0,1])
    board_row[0][6] = Knight.new("white", self, [0,6])
    board_row[0][2] = Bishop.new("white", self, [0,2])
    board_row[0][5] = Bishop.new("white", self, [0,5])
    board_row[0][3] = Queen.new("white", self, [0,3])
    board_row[0][4] = King.new("white", self, [0,4])
    board_row[1].map! {|place| Pawn.new("white", self, [1, place]) }

    board_row[2].map! {|place| NullPiece.instance }
    board_row[3].map! {|place| NullPiece.instance }
    board_row[4].map! {|place| NullPiece.instance }
    board_row[5].map! {|place| NullPiece.instance }

    board_row[6].map! {|place| Pawn.new("black", self, [6, place]) }
    board_row[7][0] = Rook.new("black", self, [7,0])
    board_row[7][7] = Rook.new("black", self, [7,7])
    board_row[7][1] = Knight.new("black", self, [7,1])
    board_row[7][6] = Knight.new("black", self, [7,6])
    board_row[7][2] = Bishop.new("black", self, [7,2])
    board_row[7][5] = Bishop.new("black", self, [7,5])
    board_row[7][3] = Queen.new("black", self, [7,3])
    board_row[7][4] = King.new("black", self, [7,4])
    board_row
  end



  def [](pos)
    row, col = pos
    @rows[row][col]
  end
  def []=(pos, val)
    row, col = pos
    @rows[row][col] = val
  end

  def move_piece(start_pos, end_pos) # add color

      #raise StandardError
    #end

  end

  def valid_pos?(pos)
    x, y = pos
    return true if x.between?(0, 7) and y.between?(0, 7)
  end

  def add_piece(piece, pos)

  end

  def checkmate?(color)
  end

  def in_check?(color)
  end

  def find_king(color)
  end

  def pieces
  end

  def dup
  end

  def mov_piece!(color, start_pos, end_pos)
  end


  private
  attr_reader :sentinel

end
