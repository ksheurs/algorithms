package sort

import "fmt"

// Numbers is the array of integers to be sorted
type Numbers []int

// Sort implements bubble sort on the Numbers type
func (arr *Numbers) Sort() {
	for i := 0; i < len(*arr); i++ {
		swapped := false

		for j := 0; j < len(*arr)-i-1; j++ {
			if (*arr)[j] > (*arr)[j+1] {
				(*arr)[j], (*arr)[j+1] = (*arr)[j+1], (*arr)[j]
				swapped = true
			}
		}

		if swapped == false {
			break
		}
	}
}

// BubbleSort implements bubble sort on a slice of numbers
func BubbleSort() {
	numbers := Numbers{3, -1, 60, 35, 45, 320, 5}

	fmt.Println("Unsorted: ", numbers)
	numbers.Sort()
	fmt.Println("Sorted: ", numbers)
}
