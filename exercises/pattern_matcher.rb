class PatternMatcher
  def initialize(pattern, string)
    @pattern = pattern
    @string = string
  end

  def parse()
    map_char = {}
    map_word = {}

    words = @string.split(" ")

    if words.length != @pattern.length
      return false
    end
    
    (0..words.length-1).each do |i|
      char = @pattern[i]
      word = words[i]
      
      if !map_char.has_key?(char)
        if map_word.has_key?(word)
          return false
        else
          map_char[char] = word
          map_word[word] = char
        end
      else
        mapped_word = map_char[char]

        if mapped_word != word
          return false
        end
      end
    end

    return true
  end
end

matcher = PatternMatcher.new("abba", "dog cat cat dog")
puts matcher.parse()
