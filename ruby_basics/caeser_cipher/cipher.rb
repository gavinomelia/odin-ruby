def cipher(text, shift)
letters = %w[a b c d e f g h i j k l m n o p q r s t u v w x y z]
shifted = letters.rotate(shift)
cipher_map = Hash[letters.zip(shifted)]
text.chars.map { |char| char == " " ? char : cipher_map[char] }.join
end