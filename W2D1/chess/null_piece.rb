require_relative 'piece'

class NullPiece < Piece
  def initialize(board, pos, color = nil)
    super
  end

  #
  # def nil?
  #   return true
  # end

  def to_s
    "."
  end
end
