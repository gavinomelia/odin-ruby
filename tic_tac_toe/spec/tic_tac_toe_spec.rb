require 'spec_helper'
require_relative '../tic_tac_toe'

RSpec.describe Game do
  let(:game) { Game.new }

  describe 'the board' do
    it 'is a 3x3 grid' do
      expect(game.board).to eq([
                                 [' ', ' ', ' '],
                                 [' ', ' ', ' '],
                                 [' ', ' ', ' ']
                               ])
    end
  end

  describe 'playing' do
    it 'allows players to make moves' do
      game.play(0, 0, 'X')
      expect(game.board).to eq([
                                 ['X', ' ', ' '],
                                 [' ', ' ', ' '],
                                 [' ', ' ', ' ']
                               ])
    end

    it 'allows players to make another move' do
      game.play(0, 0, 'X')
      game.play(1, 1, 'O')
      expect(game.board).to eq([
                                 ['X', ' ', ' '],
                                 [' ', 'O', ' '],
                                 [' ', ' ', ' ']
                               ])
    end
  end

  describe 'winning' do
    it 'detects no winner' do
      expect(game.winner?).to eq(false)
    end

    it 'detects a horizontal win' do
      game.play(0, 0, 'X')
      game.play(0, 1, 'X')
      game.play(0, 2, 'X')
      expect(game.winner?).to eq({ winner: 'X' })
    end

    it 'detects a vertical win' do
      game.play(0, 0, 'O')
      game.play(1, 0, 'O')
      game.play(2, 0, 'O')
      expect(game.winner?).to eq({ winner: 'O' })
    end

    it 'detects a diagonal win' do
      game.play(0, 0, 'X')
      game.play(1, 1, 'X')
      game.play(2, 2, 'X')
      expect(game.winner?).to eq({ winner: 'X' })
    end
  end
end
