// Your company built an in-house calendar tool called HiCal. You want to add a
// feature to see the times in a day when everyone is available.
//
// To do this, you’ll need to know when any team is having a meeting. In HiCal,
// a meeting is stored as arrays ↴ of integers [start_time, end_time].
// These integers represent the number of 30-minute blocks past 9:00am.
//
// [2, 3] meeting from 10:00 – 10:30 am
// [6, 9] meeting from 12:00 – 1:30 pm
//
// Write a function merge_ranges() that takes an array of meeting time ranges
// and returns an array of condensed ranges.
package main

import (
	"fmt"
	"math"
	"sort"
)

func main() {
	times := [][2]int{
		{0, 1}, {3, 5}, {4, 8}, {10, 12}, {9, 10},
		// {1, 2}, {2, 3},
		// {1, 5}, {2, 3},
		// {1, 10}, {2, 6}, {3, 5}, {7, 9},
	}

	SortByStartTime(times)

	ranges := ConsolidateTimeRanges(times)
	fmt.Println(ranges)
}

// ConsolidateTimeRanges reduces scheduling overlaps, neighboring schedules, etc
func ConsolidateTimeRanges(times [][2]int) [][2]int {
	ranges := make([][2]int, 0)
	ranges = append(ranges, times[0])

	for i := 1; i < len(times); i++ {
		current_start := times[i][0]
		current_end := times[i][1]
		previous_end := ranges[len(ranges)-1][1]

		if current_start <= previous_end {
			ranges[len(ranges)-1][1] = int(math.Max(float64(current_end), float64(previous_end)))
		} else {
			ranges = append(ranges, times[i])
		}
	}

	return ranges
}

// SortByStartTime sorts the 2d array of time inputs by the start time
func SortByStartTime(times [][2]int) {
	sort.Slice(times[:], func(i, j int) bool {
		for x := range times[i] {
			if times[i][x] == times[j][x] {
				continue
			}
			return times[i][x] < times[j][x]
		}
		return false
	})
}
