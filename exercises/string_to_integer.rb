class StringToInteger
    attr_reader :string

    def initialize(string)
        @string = string
    end

    def integer
        result = 0
        i = 0

        while i < string.length do
            result *= 10
            result += string[i].ord - "0".ord
            i += 1
        end

        return result
    end
end

stoi = StringToInteger.new("12345")
puts stoi.string.inspect
puts stoi.integer.inspect
