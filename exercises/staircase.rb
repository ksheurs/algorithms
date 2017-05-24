# A child is running up a staircase with n steps and can hop 1 step, 2 steps,
# or 3 steps at a time. Implement a method to count how many possible ways the
# child can run up the stairs.
#
# Runtime: O(3^n)
class Staircase
    HOPS = [1, 2, 3]

    attr_reader :step

    def initialize(step: step)
        @step = step
    end

    def paths
        count_paths(step)
    end

    private

    def count_paths(step)
        if step < 0
            0
        elsif step == 0
            1
        else
            count_paths(step - HOPS[0]) +
            count_paths(step - HOPS[1]) +
            count_paths(step - HOPS[2])
        end
    end
end

puts Staircase.new(step: 10).paths
