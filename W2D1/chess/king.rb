require_relative "piece"

class King < Piece
  def initialize(board, pos, color)
    super
  end

  def to_s
    "K"
  end
end
