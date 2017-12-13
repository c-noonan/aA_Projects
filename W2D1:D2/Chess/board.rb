require 'byebug'
require_relative "display"
require_relative "piece"

class Board
  attr_accessor :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) }

    make_starting_board

  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, value)
    x, y = pos
    @grid[x][y] = value
  end

  def move_piece(start_pos, end_pos)
    raise "Starting position invalid" if self[start_pos] == nil
    raise "A piece is there already" if self[end_pos] != nil

    self[end_pos] = self[start_pos]
    self[start_pos] = nil

  end

  protected

  def make_starting_board
    self[[0, 4]] = Queen.new(:black)
    self[[7, 4]] = Queen.new(:white)
    self[[0, 3]] = King.new(:black)
    self[[7, 3]] = King.new(:white)
    self[[0, 0]] = Rook.new(:black)
    self[[0, 7]] = Rook.new(:black)
    self[[7, 0]] = Rook.new(:white)
    self[[7, 7]] = Rook.new(:white)
    self[[0, 1]] = Knight.new(:black)
    self[[0, 6]] = Knight.new(:black)
    self[[7, 1]] = Knight.new(:white)
    self[[7, 6]] = Knight.new(:white)
    self[[0, 2]] = Bishop.new(:black)
    self[[0, 5]] = Bishop.new(:black)
    self[[7, 2]] = Bishop.new(:white)
    self[[7, 5]] = Bishop.new(:white)
    self[[1, 1]] = Pawn.new(:black)
    self[[1, 2]] = Pawn.new(:black)
    self[[1, 3]] = Pawn.new(:black)
    self[[1, 4]] = Pawn.new(:black)
    self[[1, 5]] = Pawn.new(:black)
    self[[1, 6]] = Pawn.new(:black)
    self[[1, 7]] = Pawn.new(:black)
    self[[1, 0]] = Pawn.new(:black)
    self[[6, 0]] = Pawn.new(:white)
    self[[6, 1]] = Pawn.new(:white)
    self[[6, 2]] = Pawn.new(:white)
    self[[6, 3]] = Pawn.new(:white)
    self[[6, 4]] = Pawn.new(:white)
    self[[6, 5]] = Pawn.new(:white)
    self[[6, 6]] = Pawn.new(:white)
    self[[6, 7]] = Pawn.new(:white)
  end


end
#
