require_relative "Board"
require_relative "Game"

class Card
 attr_reader :face_value, :face_up

  def initialize(number)
    @face_value = number
    @face_up = false  #initialize the card to be faced down
  end

  def hide
   @face_up = false
  end

  def reveal_card
    @face_up = true
  end

  # def to_s
  # end

  def ==(other_card)
    return true if other_card.face_value == self.face_value
    false
  end

end
