def cipher(text, shift)
  ascii =  text.chars.map { |letter| letter.ord + shift}
  shifted = ascii.map {|a| a.chr}
  shifted.join
end