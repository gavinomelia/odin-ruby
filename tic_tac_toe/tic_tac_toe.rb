class Game
  def initialize
    @board = Array.new(3) { Array.new(3, ' ') }
  end

  attr_reader :board

  def play(row, col, player)
    @board[row][col] = player
  end

  def winner?
    check_rows || check_columns || check_diagonals || false
  end

  private

  def check_rows
    board.each do |row|
      return { winner: 'X' } if row.all?('X')
      return { winner: 'O' } if row.all?('O')
    end
    nil
  end

  def check_columns
    (0..2).each do |col|
      return { winner: 'X' } if board.all? { |row| row[col] == 'X' }
      return { winner: 'O' } if board.all? { |row| row[col] == 'O' }
    end
    nil
  end

  def check_diagonals
    return { winner: 'X' } if (0..2).all? { |i| board[i][i] == 'X' }
    return { winner: 'O' } if (0..2).all? { |i| board[i][i] == 'O' }
    return { winner: 'X' } if (0..2).all? { |i| board[i][2 - i] == 'X' }
    return { winner: 'O' } if (0..2).all? { |i| board[i][2 - i] == 'O' }

    nil
  end
end
