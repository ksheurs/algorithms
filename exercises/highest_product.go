// Given an array of integers, find the highest product you can get from three
// of the integers.
//
// O(n) time, O(1) space
package main

import (
	"fmt"
	"math"
)

var (
	numbers     = []int{3, 2, 10, 5, 8, 12, 17, 4} // {-10, -10, 1, 3, 2}
	maxNumbers  []int
	minValue    int = 0
	minPosition int = 0
	capacity    int = 3
)

func main() {
	for i := 0; i < len(numbers); i++ {
		number := int(math.Abs(float64(numbers[i])))

		if len(maxNumbers) < capacity {
			maxNumbers = append(maxNumbers, number)

			if len(maxNumbers) == 1 || number <= minValue {
				minValue = number
				minPosition = len(maxNumbers) - 1
			}
		} else if numbers[i] > minValue {
			minValue, minPosition = appendNumber(number)
		}
	}

	product := 1

	for i := 0; i < len(maxNumbers); i++ {
		if maxNumbers[i] != 0 {
			product *= maxNumbers[i]
		}
	}

	fmt.Println("Numbers", numbers)
	fmt.Println("Max Numbers", maxNumbers)
	fmt.Println("Min Value", minValue)
	fmt.Println("Min Position", minPosition)
	fmt.Println("Max Product", product)
}

func appendNumber(number int) (int, int) {
	maxNumbers[minPosition] = number

	value := 0
	position := 0

	for i := 0; i < len(maxNumbers); i++ {
		if maxNumbers[i] < value || value == 0 {
			value = maxNumbers[i]
			position = i
		}
	}

	return value, position
}
