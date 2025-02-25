require 'spec_helper'
require_relative '../game'

RSpec.describe Game do
  it 'starts the game' do
    game = Game.new
    expect(game).to be_an_instance_of(Game)
  end

  it 'display the right winner' do
    game = Game.new
    allow(game).to receive(:request_move).and_return([0, 0], [1, 0], [0, 1], [1, 1], [0, 2])
    expect { game.start }.to output(/Player X wins/).to_stdout
  end

  it 'handles a draw properly' do
    game = Game.new
    allow(game).to receive(:request_move).and_return(
      [0, 0], [0, 1], [0, 2],
      [1, 1], [1, 0], [1, 2],
      [2, 1], [2, 0], [2, 2]
    )
    expect { game.start }.to output(/The game is a draw!/).to_stdout
  end
end
