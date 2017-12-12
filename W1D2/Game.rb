require_relative "Board"
require_relative "Card"
require_relative "HumanPlayer"
require 'byebug'

class Game
  attr_reader :board, :player

  def initialize(player, board)
    @board = board
    @player = player
  end

  def play
    @board.populate
    while !@board.won?
      @board.render
      # puts ("Enter a position in form [a, b]:")
      # guessed_position = gets.chomp.split(",").map(&:to_i)
      # #debugger
      # #p guessed_position
      # while guessed_position == @player.previous_guess
      #   puts ("That position has already been flipped! Pick again:")
      #   guessed_position = gets.chomp.split(",").map(&:to_i)
      # end
      @player.prompt
      @board.reveal(@player.guessed_position) #flipping
      #p @board[guessed_position].face_up
      if @player.previous_guess == nil #first pick of each pair
        @player.previous_guess = @player.guessed_position
      elsif @board[@player.previous_guess] == @board[@player.guessed_position] #comparing card values
        # @board.count_table.delete(@board[guessed_position])

        p @board.count_table
        @player.previous_guess = nil   #after fliping a pair
      else #this is when cards dont match
        @board.render
        puts "Cards don't match!! "
        @board[@player.guessed_position].hide #flipping current card down
        @board[@player.previous_guess].hide #flipping the previous card down
        @player.previous_guess = nil   #after fliping a pair
      end
    end
    puts "Congratulations, you won!!"
  end

end

# puts __FILE__
# puts $PROGRAM_NAME
if __FILE__ == $PROGRAM_NAME
  board = Board.new(4)
  player = HumanPlayer.new
  game = Game.new(player, board)
  game.play
end
