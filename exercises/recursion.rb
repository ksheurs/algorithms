class Recursion
    def initialize(arr)
        @arr = arr
    end

    def execute
        iter_arr(@arr, 0)
    end

    private

    def iter_arr(arr, i)
        if arr[i] != nil
            puts arr[i]
            iter_arr(arr, i+1)
        end
    end
end

Recursion.new([1, 2, 3, 4, 5]).execute
