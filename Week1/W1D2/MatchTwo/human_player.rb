require_relative 'player'

class HumanPlayer < Player
  def initialize(name)
    super(name)
  end

  def prompt
    puts "Enter a guess: "
    input = gets.chomp
    input.split(",").map(&:strip)
  end
end
