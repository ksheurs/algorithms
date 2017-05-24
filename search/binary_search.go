package search

import "fmt"

// BinarySearch implements binary search on a sorted array
func BinarySearch() {
	numbers := []int{1, 3, 4, 6, 7, 9, 10, 11, 13, 15}
	query := 6

	fmt.Printf("Searching %v for %d...\n", numbers, query)

	index, found := func(numbers []int, query int) (int, bool) {
		start := 0
		end := len(numbers) - 1

		for start <= end {
			mid := start + (end-start)/2

			if numbers[mid] == query {
				return mid, true
			}

			if numbers[mid] > query {
				end = mid - 1
			} else {
				start = mid + 1
			}
		}

		return -1, false
	}(numbers, query)

	if found {
		fmt.Printf("Result found at index %d!\n", index)
	} else {
		fmt.Println("Result not found!")
	}
}
