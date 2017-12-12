require 'byebug'

class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def guess
    puts "#{@name} enter a letter: "
    gets.chomp
  end
end

class Game
  def initialize(*input_players)
    @players = []
    self.initialize_players(input_players)
    @current_player = @players.sample
    @fragment = ''
    @dictionary = {}
    File.open('dictionary.txt') do |fp|
      fp.each do |line|
        key, value = line.chomp.split
        @dictionary[key] = value
      end
    end
  end

  def initialize_players(input_players)
    input_players.each { |name| @players << Player.new(name) }
  end

  def play_round
    loop do
      take_turn(current_player)
      break if won?
      next_player!
    end

    puts "Sorry #{@current_player.name}, you lose!!!"

  end

  def won?
    return true if @dictionary.keys.any? { |word| word == @fragment }
  end

  def current_player
    @current_player
  end

  # def previous_player
  # end

  def next_player!
    num_players = @players.length
    current_player_index = @players.find_index(@current_player)
    @current_player = @players[(current_player_index + 1) % num_players]
  end

  def take_turn(player)
    user_input = ''
    user_input = player.guess until valid_play?(user_input)
    @fragment << user_input
  end

  def valid_play?(string)
    letters = ('a'..'z').to_a
    return false if !letters.include?(string) || string.empty?
    @dictionary.keys.any? { |word| word.start_with?(@fragment+string) }
  end
end

if __FILE__ == $PROGRAM_NAME
  game = Game.new("Nick", "Katie")
  game.play_round
end
