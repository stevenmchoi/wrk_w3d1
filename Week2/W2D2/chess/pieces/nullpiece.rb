require_relative 'piece'
require 'singleton'

class NullPiece < Piece
  include Singleton

  attr_accessor :color, :symbol

  def initialize
  end
  def moves
  end
  def symbol
    " \s "
  end
end
