require 'singleton'

class Piece

  def initialize(color)
    @color = color
  end

  def moves

  end

end

class NullPiece < Piece
  include Singleton
end

class Queen < Piece
  attr_reader :symbol

  def initialize(color)
    super(color)
    set_piece(color)
  end

  def set_piece(color)
    if color == :white
      @symbol = "\u{2655}"
    else
      @symbol = "\u{265B}"
    end
  end

end

class Rook < Piece
  attr_reader :symbol

  def initialize(color)
    super(color)
    set_piece(color)
  end

  def set_piece(color)
    if color == :white
      @symbol = "\u{2656}"
    else
      @symbol = "\u{265C}"
    end
  end
end

class King < Piece
  attr_reader :symbol

  def initialize(color)
    super(color)
    set_piece(color)
  end

  def set_piece(color)
    if color == :white
      @symbol = "\u{2654}"
    else
      @symbol = "\u{265A}"
    end
  end
end

class Knight < Piece
  attr_reader :symbol

  def initialize(color)
    super(color)
    set_piece(color)
  end

  def set_piece(color)
    if color == :white
      @symbol = "\u{2658}"
    else
      @symbol = "\u{265E}"
    end
  end
end

class Bishop < Piece
  attr_reader :symbol

  def initialize(color)
    super(color)
    set_piece(color)
  end

  def set_piece(color)
    if color == :white
      @symbol = "\u{2657}"
    else
      @symbol = "\u{265D}"
    end
  end
end

class Pawn < Piece
  attr_reader :symbol

  def initialize(color)
    super(color)
    set_piece(color)
  end

  def set_piece(color)
    if color == :white
      @symbol = "\u{2659}"
    else
      @symbol = "\u{265F}"
    end
  end
end

module SlidingPiece
end

module SteppingPiece
end
