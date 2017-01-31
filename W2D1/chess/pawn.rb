require_relative "piece"

class Pawn < Piece
  def initialize(board, pos, color)
    super
  end

  def to_s
    "P"
  end
end
