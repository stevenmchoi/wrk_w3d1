require_relative 'player'

class Game
  attr_accessor :players, :fragment, :dictionary, :cur_player, :prev_player

  def self.init_with_dictionary(file)
    File.readlines(file).map(&:chomp)
  end

  def initialize(players, file)
    @players = players
    @cur_player = players[:player1]
    @prev_player = players[:player2]
    @dictionary = Game.init_with_dictionary(file)
    @fragment = ""
  end

  def play_round

  end

  def current_player
    @cur_player
  end

  def previous_player
    @prev_player
  end

  def next_player!
    player_keys = @players.keys
    prev_player_idx = player_keys.find(@current_player)
    cur_player_idx = prev_player_idx + 1

    @prev_player = player_keys[prev_player_idx]
    @cur_player = player_keys[cur_player_idx]
  end

  def take_turn(player)
    guess = player.guess
    temp_frag = @fragment + guess
    p @fragment
    while !valid_play?(temp_frag)
      guess = player.alert_invalid_guess
      temp_frag = @fragment + guess
    end

    @fragment += guess
    p @fragment
  end

  def won?

  end

  def valid_play?(string)
    @dictionary.any? do |word|
      word.match(/#{string}.*/) != nil
    end
  end

end

if $PROGRAM_NAME == __FILE__
  first_player = Player.new
  second_player = Player.new(name="John")
  players = { player1: first_player, player2: second_player }
  game = Game.new(players, "dictionary.txt")
  game.take_turn(game.current_player)
  game.next_player!
  p current_player
  p previous_player
end
