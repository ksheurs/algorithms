# Reverse a string in place
class StringReverse
    attr_reader :str

    def initialize(str)
        @str = str
    end

    def reverse
        i = 0
        len = str.length - 1

        while i <= len / 2
            tmp = str[i]
            str[i] = str[len-i]
            str[len-i] = tmp

            i += 1
        end

        return str
    end
end

puts StringReverse.new("string").reverse
