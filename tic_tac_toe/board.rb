class Board
  def initialize
    @board = Array.new(3) { Array.new(3, ' ') }
  end

  attr_reader :board

  def play(row, col, player)
    return false if taken?(row, col)

    @board[row][col] = player
    true
  end

  def taken?(row, col)
    board[row][col] != ' '
  end

  def draw?
    board.flatten.none? { |cell| cell == ' ' }
  end

  def winner?
    check_rows || check_columns || check_diagonals || false
  end

  def display
    puts '  0 1 2'
    board.each_with_index do |row, i|
      puts "#{i} #{row.join('|')}"
    end
  end

  private

  def all_same?(arr)
    arr.uniq.size == 1 && arr.first != ' '
  end

  def check_rows
    board.any? { |row| all_same?(row) }
  end

  def check_columns
    (0..2).any? { |col| all_same?(board.map { |row| row[col] }) }
  end

  def check_diagonals
    left_to_right = (0..2).map { |i| board[i][i] }
    right_to_left = (0..2).map { |i| board[i][2 - i] }
    all_same?(left_to_right) || all_same?(right_to_left)
  end
end
