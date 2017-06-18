# We are given 3 strings: str1, str2, and str3. Str3 is said to be a shuffle
# of str1 and str2 if it can be formed by interleaving the characters of str1
# and str2 in a way that maintains the left to right ordering of the characters
# from each string. For example, given str1=”abc” and str2=”def”, str3=”dabecf”
# is a valid shuffle since it preserves the character ordering of the two
# strings. So, given these 3 strings write a function that detects whether
# str3 is a valid shuffle of str1 and str2.
class CombineStrings
    attr_reader :str1, :str2, :str3

    def initialize(str1: str1, str2: str2, str3: str3)
        @str1 = str1
        @str2 = str2
        @str3 = str3
    end

    def valid?
        str1Pos, str2Pos = 0, 0

        i = 0
        while i < str3.length
            char = str3[i]

            if str1[str1Pos] == char
                str1Pos += 1
            elsif str2[str2Pos] == char
                str2Pos += 1
            else
                break
            end

            i += 1
        end

        return str1Pos == str1.length && str2Pos == str2.length
    end
end

puts CombineStrings.new(str1: "abc", str2: "def", str3: "dabecf").valid?
