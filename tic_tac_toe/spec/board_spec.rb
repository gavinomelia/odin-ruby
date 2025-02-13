require 'spec_helper'
require_relative '../board'

RSpec.describe Board do
  let(:board) { Board.new }

  describe 'the board' do
    it 'is a 3x3 grid' do
      expect(board.board).to eq([
                                  [' ', ' ', ' '],
                                  [' ', ' ', ' '],
                                  [' ', ' ', ' ']
                                ])
    end
  end

  describe '#play' do
    it 'places a player mark on the board' do
      board.play(0, 0, 'X')
      expect(board.board[0][0]).to eq('X')
    end

    it 'returns false if the cell is already occupied' do
      board.play(0, 0, 'X')
      expect(board.play(0, 0, 'O')).to be_falsey
    end
  end

  describe 'winning' do
    it 'detects no winner' do
      expect(board.winner?).to eq(false)
    end

    it 'detects a horizontal win' do
      board.play(0, 0, 'X')
      board.play(0, 1, 'X')
      board.play(0, 2, 'X')
      expect(board.winner?).to eq(true)
    end

    it 'detects a vertical win' do
      board.play(0, 0, 'O')
      board.play(1, 0, 'O')
      board.play(2, 0, 'O')
      expect(board.winner?).to eq(true)
    end

    it 'detects a diagonal win' do
      board.play(0, 0, 'X')
      board.play(1, 1, 'X')
      board.play(2, 2, 'X')
      expect(board.winner?).to eq(true)
    end
  end

  it 'returns false if the cell is already occupied' do
    board.play(0, 0, 'X')
    expect(board.play(0, 0, 'O')).to be_falsey
  end
end
