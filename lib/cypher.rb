# frozen_string_literal: true

class Cypher
  def initialize
    @alphabet = ('a'..'z').to_a
  end

  def encode(string, shift)
    string.chars.map do |char|
      if @alphabet.include?(char)
        @alphabet[(@alphabet.index(char) + shift) % 26]
      else
        char
      end
    end.join
  end

  def decode(string, shift)
    string.chars.map do |char|
      if @alphabet.include?(char)
        @alphabet[(@alphabet.index(char) - shift) % 26]
      else
        char
      end
    end.join
  end
end
