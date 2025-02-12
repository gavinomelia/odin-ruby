require_relative 'board'

class Game
  def initialize
    @board = Board.new
    @current_player = 'X'
  end

  def start
    play_turn until @board.winner? || @board.draw?
    end_game
  end

  def play_turn
    @board.display
    row, col = request_move
    unless @board.play(row, col, @current_player)
      puts 'Invalid move, try again.'
      return
    end
    switch_player
  end

  def end_game
    @board.display
    switch_player # switch back to the winning player
    if @board.winner?
      puts "Player #{@current_player} wins"
    else
      puts 'The game is a draw! Bummer. That is what you get for playing a lame game. Maybe you should try chess instead.'
    end
  end

  private

  def request_move
    puts 'Enter row:'
    row = gets.chomp.to_i
    puts 'Enter column:'
    col = gets.chomp.to_i
    [row, col]
  end

  def switch_player
    @current_player = @current_player == 'X' ? 'O' : 'X'
  end
end
