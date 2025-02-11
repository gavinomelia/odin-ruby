require 'spec_helper'
require_relative '../stock_picker'

RSpec.describe 'Stock Picker' do

  describe 'Takes in an array of stock prices, one for each hypothetical day. Returns a pair of days representing the best day to buy and the best day to sell.' do

    it 'picks simple best days' do
      expect(stock_picker([5, 1, 5, 2])).to eq([1,2])
    end

    it 'picks the best days' do
      expect(stock_picker([17,3,6,9,15,8,6,1,10])).to eq([1,4])
    end

    xit 'picks the best days' do
      expect(stock_picker([17,3,6,9,15,8,6,1,10])).to eq([1,4])
    end
  end
end