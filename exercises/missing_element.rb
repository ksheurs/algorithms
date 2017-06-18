# There is an array of non-negative integers. A second array is formed by
# shuffling the elements of the first array and deleting a random element.
# Given these two arrays, find which element is missing in the second array.
class MissingElement
    attr_reader :a1, :a2

    def initialize
        @a1 = [4, 1, 0, 2, 9, 6, 8, 7, 5, 3]
        @a2 = [6, 4, 7, 2, 1, 0, 8, 3, 9]
    end

    def find_optimized
        result = 0

        for num in a1+a2
            result ^= num
        end

        return result
    end

    def find
        map = {}

        a2.each do |num|
            map[num] ||= 0
            map[num] += 1
        end

        a1.each do |num|
            if !map[num]
                return num
            end

            map[num] -= 1
        end
    end
end

puts MissingElement.new.find
puts MissingElement.new.find_optimized
