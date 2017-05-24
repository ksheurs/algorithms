# N-Choose-K is defined to be the number of ways one can select k objects from a
# pool of n objects. So you might use n-choose-k to figure out how many ways you
# can seat 7 people in 4 chairs, or draw 3 marbles from 5 different colored
# marbles.
#
# 5-choose-3? Print both the number of subsets and the combinations.
#
# A B C D E
# * * *
# * *   *
# * *     *
# *   * *
# *   *   *
# *     * *
#   * * *
#   * *   *
#   *   * *
#     * * *
class Marbles
    def execute
        puts "Subset:"
        puts subset(5, 3)

        puts "\nCombinations:"
        marbles = ["A", "B", "C", "D", "E"]
        combinations(marbles, len=3, result="")
    end

    private

    def subset(n, k)
        if k == 0 || n == k
            1
        else
            subset(n-1, k-1) + subset(n-1, k)
        end
    end

    def combinations(marbles, len, result)
        if len == 0
            puts result
        else
            for i in 0...marbles.length do
                combinations(marbles[i+1, marbles.length], len-1, result + marbles[i])
            end
        end
    end
end

Marbles.new.execute
