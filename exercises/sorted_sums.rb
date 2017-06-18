# You have two sorted lists A and B, find the kth smallest sum. Where sum is
# defined as a+b such that a belongs to list A and b belongs to list B.
# For e.g, if A=[1,2,3] B=[4,5,6], the list of possible sums are
# [5,6,6,7,7,7,8,8,9], and hence the 5th smallest sum is 7.
class SortedSums
    attr_reader :a1, :a2

    def initialize
        @a1 = [1, 2, 3]
        @a2 = [4, 5, 6]
    end

    def smallest_sum(k)
        sums = calculate_sums
        merge_sort(sums)[k]
    end

    protected

    def merge_sort(nums)
        if nums.length <= 1
            return nums
        end

        mid = nums.length / 2
        first = merge_sort(nums[0...mid])
        second = merge_sort(nums[mid...nums.length])
        return merge(first, second)
    end

    def merge(left, right)
        result = []

        while left.length > 0 || right.length > 0
            if left.length == 0
                result += right
                break
            end

            if right.length == 0
                result += left
                break
            end

            if left[0] <= right[0]
                result << left[0]
                left = left[1..left.length]
            else
                result << right[0]
                right = right[1..right.length]
            end
        end

        return result
    end

    def calculate_sums
        sums = []
        a1.each do |a|
            a2.each do |b|
                sums << a + b
            end
        end
        return sums
    end
end

puts SortedSums.new.smallest_sum(5)
