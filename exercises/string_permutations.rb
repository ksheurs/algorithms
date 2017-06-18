# Write a recursive function for generating all permutations of an input string.
class StringPermutations
    attr_reader :str

    def initialize(str)
        @str = str
    end

    def permutations
        permute(str, 0, str.length-1)
    end

    protected

    def permute(s, left, right)
        if left == right
            puts s
        else
            i = left
            while i <= right
                swap(s, left, i);
                permute(s, left+1, right);
                swap(s, left, i);

                i += 1
            end
        end
    end

    def swap(s, x, y)
        tmp = s[x]
        s[x] = s[y]
        s[y] = tmp
    end
end

StringPermutations.new("abc").permutations
