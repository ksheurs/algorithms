# Given an integer array, output all distinct pairs that sum up to a specific
# value k.
class PairSum
    attr_reader :nums

    def initialize
        @nums = [1, 3, 2, 4, 5, 6, 7]
    end

    def pairs(k)
        nums.sort!

        left = 0
        right = nums.length - 1

        while left < right
            sum = nums[left] + nums[right]
            if sum == k
                puts "#{nums[left]}, #{nums[right]}"
                left += 1
            elsif sum < k
                left += 1
            else
                right -= 1
            end
        end
    end
end

PairSum.new.pairs(7)
