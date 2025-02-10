require 'spec_helper'
require_relative '../cipher'

RSpec.describe 'Caeser Cipher' do

  describe 'Roman Encryption' do

    it 'shifts one letter' do
      expect(cipher("abc", 1)).to eq("bcd")
    end
    
    it 'shifts five letters' do
      expect(cipher("abc", 5)).to eq("fgh")
    end

    it 'shifts with spaces' do
      expect(cipher("a b c", 1)).to eq("b c d")
    end
  end
end