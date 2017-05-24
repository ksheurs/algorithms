package sort

import "fmt"

func mergeSort(numbers []int) []int {
	if len(numbers) <= 1 {
		return numbers
	}

	mid := len(numbers) / 2
	firstHalf := mergeSort(numbers[:mid])
	secondHalf := mergeSort(numbers[mid:])

	return merge(firstHalf, secondHalf)
}

func merge(left, right []int) []int {
	result := make([]int, 0, len(left)+len(right))

	for len(left) > 0 || len(right) > 0 {
		if len(left) == 0 {
			return append(result, right...)
		}

		if len(right) == 0 {
			return append(result, left...)
		}

		if left[0] <= right[0] {
			result = append(result, left[0])
			left = left[1:]
		} else {
			result = append(result, right[0])
			right = right[1:]
		}
	}

	return result
}

func MergeSort() {
	numbers := []int{3, -1, 60, 35, 45, 320, 5}

	fmt.Println("Unsorted: ", numbers)
	fmt.Println("Sorted: ", mergeSort(numbers))
}
