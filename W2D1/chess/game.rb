require_relative 'board'
require_relative 'display'

class Game

  def initialize(board, display)
    @board = board
    @display = display
  end

  def play
    @display.render
    while true
      @display.get_input
      @display.render
    end
  end

end

if __FILE__ == $PROGRAM_NAME
  board = Board.new
  display = Display.new(board)
  game = Game.new(board, display)
  game.play
end
