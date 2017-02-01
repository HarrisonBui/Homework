require_relative 'rook'
require_relative 'knight'
require_relative 'bishop'
require_relative 'queen'
require_relative 'king'
require_relative 'pawn'
require_relative 'null_piece'

class Board

  attr_reader :grid

  def initialize
    @grid = Array.new(8){ Array.new(8) }
    setup_board
    @taken_pieces = []
  end

  def setup_board
    back_rank = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]
    pawns = Array.new(8, Pawn)
    null_piece = Array.new(8, NullPiece)
    fill_row(0, back_rank, :blue)
    fill_row(1, pawns, :blue)
    (2..5).each { |rank| fill_row(rank, null_piece, :white) }
    fill_row(6, pawns, :red)
    back_rank[3], back_rank[4] = back_rank[4], back_rank[3]
    fill_row(7, back_rank, :red)
  end

  def fill_row(row, piece_classes, color)
    0.upto(7) do |col|
      place_new_piece([row,col], piece_classes[col], color)
    end
  end

  def [](pos)
    row,col = pos
    @grid[row][col]
  end

  def []=(pos, piece)
    row, col = pos
    @grid[row][col] = piece
  end

  def place_new_piece(pos, piece_type, color)
    row, col = pos
    piece = piece_type.new(self, pos, color)
    @grid[row][col] = piece
  end

  def move_piece(start_pos, end_pos)
    piece = self[start_pos]
    other_piece = self[end_pos]
    raise "No Piece" unless piece && piece.class != NullPiece
    raise "Cannot move here" unless piece.can_move?(end_pos)
    if other_piece.class == NullPiece || other_piece.color == piece.color
      switch_pieces(piece, other_piece)
    else
      take_piece(piece, other_piece)
    end
  end

  def take_piece(attacker, taken_piece)
    @taken_pieces << taken_piece
    replacement = NullPiece.new(self, taken_piece.pos)
    self[taken_piece.pos] = replacement
    switch_pieces(attacker, replacement)
  end

  def switch_pieces(piece, other_piece)
    self[piece.pos], self[other_piece.pos] = other_piece, piece
    piece.pos, other_piece.pos = other_piece.pos, piece.pos
  end

end
