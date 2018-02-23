require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'
require 'byebug'

class Game
  attr_accessor :player, :board, :size, :cur_guess, :last_guess

  def initialize(size = 6, player)
    size.odd? ? @size = size - 1 : @size = size
    @board = Board.new(@size)
    @player = player
  end

  def play
    until over?
      play_turn
    end
  end

  def play_turn
    @last_guess = nil
    system "clear"
    @board.render
    @cur_guess = cleanse_input(@player.prompt)
    make_guess
    @cur_guess = cleanse_input(@player.prompt)
    make_guess

  end

  def cleanse_input(clean_input)
      if clean_input.all? { |pos| (48..57) === (pos.ord) } == false
        puts "Invalid input, please try again."
        clean_input = get_guess
      end

      clean_input.map!(&:to_i)

      if clean_input.any? {|pos| pos.to_i > @board.size}
        puts "Coordinate out of bounds, please try again."
        clean_input = get_guess
      elsif @last_guess == clean_input
        puts "You've already guessed that position, please try again."
        clean_input = get_guess
      elsif @board[clean_input].nil? || @board[clean_input].face == :revealed
        puts "That card is already shown, please try again."
        clean_input = get_guess
      end
    clean_input
  end

  def make_guess
    @board.reveal_guess(@cur_guess)
    system "clear"
    @board.render
    sleep(3)

    unless @last_guess == nil
      if @board[@last_guess].card_value != @board[@cur_guess].card_value
        @board[@last_guess].hide
        @board[@cur_guess].hide
      end
    end
    @last_guess = @cur_guess
  end
  def over?
    @board.won?
  end

end

if $PROGRAM_NAME == __FILE__

  player = HumanPlayer.new("Dave")
  g = Game.new(4, player)
  g.play
end
