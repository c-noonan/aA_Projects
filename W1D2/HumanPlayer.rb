require_relative "Game"

class HumanPlayer
  attr_reader :guessed_position
  attr_accessor :previous_guess

  def initialize
    @guessed_position = nil
    @previous_guess = nil
  end


  def prompt
    puts ("Enter a position in form [a, b]:")
    get_input
    while @guessed_position == @previous_guess
      puts ("That position has already been flipped! Pick again:")
      get_input
    end
  end

  def get_input
    @guessed_position = gets.chomp.split(",").map(&:to_i)
  end

end
