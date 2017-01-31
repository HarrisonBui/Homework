require "colorize"
require_relative "cursor"

class Display

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], @board)
  end

  def get_input
    @cursor.get_input
  end

  def render
    system "clear"
    @board.grid.each do |row|
      row = row.map do |piece|
        if piece.pos == @cursor.cursor_pos
          piece.to_s.colorize(color: piece.color, background: :light_white)
        else
          piece.to_s.colorize(piece.color)
        end
      end.join(' ')
      puts row
    end
    nil
  end
end
