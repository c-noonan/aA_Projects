require 'colorize'
require_relative 'cursor'
require_relative 'board'
require_relative 'piece'

class Display
  attr_reader :cursor

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render
    (0..7).each do |row|
      (0..7).each do |col|
        position = @board[[row, col]]
        if [row, col] == cursor.cursor_pos
          if position.nil?
            print '  '.colorize(:background => :cyan)
          else
            string = position.symbol + ' '
            print string.colorize(:background => :cyan)
          end
        else
          if position.nil?
            print '  '
          else
            print position.symbol + " "
          end
        end
      end
      puts
    end
  end

end

if __FILE__ == $PROGRAM_NAME
  board = Board.new
  display = Display.new(board)
  while true
    display.render
    display.cursor.get_input
    system("clear")
    puts display.cursor.cursor_pos
  end
end
