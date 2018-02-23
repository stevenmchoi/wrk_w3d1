class Player
  attr_accessor :name

  def initialize(name="Drew")
    @name = name
  end

  def guess
    puts "Please enter a letter: "
    gets.chomp
  end

  def alert_invalid_guess
    puts "Invalid guess!"
    guess
  end


end
