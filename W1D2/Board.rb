require_relative "Card"
require_relative "Game"
require 'byebug'

class Board
  attr_reader :grid
  attr_accessor :count_table

  def count_tale
    @count_table
  end
  
  def count_table=(other)
    @count_table = other
  end

  def initialize(size)
    @grid = Array.new(size) { Array.new(size) }
    @count_table = Hash.new(0)  # counter hash
    self[[0,0]]
  end

  def populate
    @grid.each_with_index do |row, idx1|
      row.each_with_index do |col, idx2|
        new_card_value = rand(1..(@grid.length**2/2))
        while @count_table[new_card_value] >= 2
          new_card_value = rand(1..(@grid.length**2/2)) #keep generating random number if card number is more than 2
          p new_card_value
        end
        self[[idx1, idx2]] = Card.new(new_card_value) # creating new one
        @count_table[new_card_value] +=1 #keep track of nnumber of card
      end
    end
    p @count_table
  end

  def [](pos)
    @grid[pos[0]][pos[1]]
  end

  def []=(pos, card)
    @grid[pos[0]][pos[1]] = card
  end

  def render
    @grid.each_with_index do |row, idx1|
      row.each_with_index do |col, idx2|
        if self[[idx1, idx2]].face_up == true
          print self[[idx1, idx2]].face_value
        else
          print "[*]"
        end
      end
      puts ''
    end
  end

  def won?
    @grid.each_with_index do |row, idx1|
      row.each_with_index do |col, idx2|
        if self[[idx1, idx2]].face_up == false #if one caard is face down, you havent won
          return false
        end
      end
    end
    true
  end

  def reveal(pos)
    self[pos].reveal_card if self[pos].face_up == false
    self[pos].face_value
  end

end
