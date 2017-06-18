# Given an array of integers (positive and negative) find the largest
# continuous sum.
class LargestContinuousSum
    attr_reader :nums

    def initialize
        @nums = [2, 3, 25, -3, -2, 1, 6, 3, 8]
    end

    def sum
        maxSum = currentSum = nums[0]

        i = 1
        while i < nums.length
            if currentSum + nums[i] > currentSum
                currentSum = currentSum + nums[i]
            end

            if currentSum > maxSum
                maxSum = currentSum
            end

            i += 1
        end

        return maxSum
    end
end

puts LargestContinuousSum.new.sum
