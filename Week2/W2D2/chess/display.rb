require 'colorize'
require_relative 'pieces/piece'
require_relative 'pieces/rook'
require_relative 'pieces/bishop'
require_relative 'pieces/knight'
require_relative 'pieces/queen'
require_relative 'pieces/king'
require_relative 'pieces/pawn'
require_relative 'pieces/nullpiece'
require_relative 'cursor'
require_relative 'board'
class Display
  attr_reader :board, :cursor

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,2], board)
  end

  def render
    r, c = cursor.cursor_pos
    board.rows.each_index do |row|
      print "|"
      board.rows.each_index do |col|
        if row == r && col == c
          print board[[row,col]].symbol.magenta
        else
          #TEST With ROOK for unicode
          print board[[row,col]].symbol
          #print "__|"
        end
      end
    puts
  end
end
end

if $PROGRAM_NAME == __FILE__
  b = Board.new
  d = Display.new(b)
  d.render
end
