require_relative "piece"

class Knight < Piece
  def initialize(board, pos, color)
    super
  end

  def to_s
    "N"
  end
end
