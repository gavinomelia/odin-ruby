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

    it 'wraps a and z' do
      expect(cipher("zzz", 2)).to eq("bbb")
      expect(cipher("aaa", 27)).to eq("bbb")
    end

    it 'works with periods' do
      expect(cipher("abc.", 1)).to eq ("bcd.")
    end

    it 'works with commas' do
      expect(cipher("a,bc", 1)).to eq ("b,cd")
    end

    it 'works with uppercase' do
      expect(cipher("AbC", 1)).to eq ("BcD")
    end
  end
end