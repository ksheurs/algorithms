# Reverse the words in a given sentence.
class SentenceReverse
    attr_reader :sentence

    def initialize(sentence)
        @sentence = sentence
    end

    def reverse
        words = []

        i = 0
        start = 0
        while i < sentence.length
            if sentence[i] == " "
                words << sentence[start..i]
                start = i+1
            end

            i += 1
        end

        words << sentence[start..sentence.length-1]

        i = words.length-1
        while i >= 0
            print words[i] + " "
            i -= 1
        end
    end
end

sentence = "This is how you reverse words in a sentence."
puts SentenceReverse.new(sentence).reverse
