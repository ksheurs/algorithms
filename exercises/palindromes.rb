# Given a string, count all palindrome substrings. Note, each character itself
# is considered a palindrome.
#
# abbaeae = 4 + str.length = 11
class Palindrome
    attr_reader :str

    def initialize(str)
        @str = str
    end

    def count
        num = str.length

        i = 0
        while i < str.length
            j = i + 1

            while j < str.length
                if palindrome?(str[i..j])
                    num += 1
                end

                j += 1
            end

            i += 1
        end

        return num
    end

    protected

    def palindrome?(chars)
        result = true

        left = 0
        right = chars.length - 1

        while true
            if chars[left] != chars[right]
                result = false
                break
            end

            if left == right || left+1 == right
                break
            end

            left += 1
            right -= 1
        end

        return result
    end
end

puts Palindrome.new("abbaeae").count
