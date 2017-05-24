# Imagine a robot sitting on the upper left corner of a grid with r rows and c
# columns. The robot can only move in two directions, right and down, but certain
# cells are "off limits" such that the robot cannot step on them. Design an
# algorithm to find a path for the robot from the top left to the bottom right.
#
# Runtime: O(2^r+c) or O(rc) w/ caching
class RobotGrid
    attr_reader :rows, :columns, :off_limits

    def initialize(rows: rows, columns: columns, off_limits: [])
        @rows = rows
        @columns = columns
        @off_limits = off_limits
    end

    def go
        row = rows-1
        col = columns-1

        if get_path(row, col, path = [], cache = [])
            return draw(path)
        end

        return nil
    end

    private

    def get_path(row, col, path, cache)
        if row < 0 || col < 0 || off_limits?(row, col)
            return false
        end

        if already_visited?(cache, row, col)
            return false
        end

        found = row == 0 && col == 0

        if found || get_path(row-1, col, path, cache) || get_path(row, col-1, path, cache)
            path << { row: row, col: col }
            return true
        end

        cache << { row: row, col: col }
        return false
    end

    def already_visited?(cache, row, col)
        cache.find { |point| point[:row] == row && point[:col] == col }
    end

    def off_limits?(row, col)
        off_limits.each do |cell|
            if cell[0] == row && cell[1] == col
                return true
            end
        end

        return false
    end

    def draw(path)
        (0...rows).each_with_index do |_, row|
            (0...columns).each_with_index do |_, col|
                if path.find { |point| point[:row] == row && point[:col] == col }
                    print "* "
                elsif off_limits?(row, col)
                    print "x "
                else
                    print "  "
                end
            end

            print "\n"
        end
    end
end

RobotGrid.new(
    rows: 15,
    columns: 15,
    off_limits: [[0, 1], [2, 2], [3, 2], [2, 4]],
).go
