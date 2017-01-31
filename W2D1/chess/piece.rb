class Piece

  attr_accessor :pos, :color

  def initialize(board, pos, color)
    @board = board
    @pos = pos
    @color = color
  end

  def can_move?(pos)
    true
  end



end
