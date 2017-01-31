require_relative "piece"

class Queen < Piece
  def initialize(board, pos, color)
    super
  end

  def to_s
    "Q"
  end
end
