// Write a function that takes an array of integers and returns an array of
// the products.
//
// O(n^2) and O(n)
package main

import "fmt"

func main() {
	numbers := []int{1, 7, 3, 4}

	products := ProductsOfIntegers(numbers)
	fmt.Println(products)

	products = ProductsOfIntegersOptimized(numbers)
	fmt.Println(products)
}

// ProductsOfIntegers is an O(n^2) approach
func ProductsOfIntegers(numbers []int) []int {
	products := make([]int, len(numbers))

	for i := 0; i < len(numbers); i++ {
		products[i] = 1

		for j := 0; j < len(numbers); j++ {
			if i != j {
				products[i] *= numbers[j]
			}
		}
	}

	return products
}

// ProductsOfIntegersOptimized is an O(n) approach
func ProductsOfIntegersOptimized(numbers []int) []int {
	products := make([]int, len(numbers))
	var product_so_far int

	product_so_far = 1
	for i := 0; i < len(numbers); i++ {
		products[i] = product_so_far
		product_so_far *= numbers[i]
	}

	product_so_far = 1
	for i := len(numbers) - 1; i >= 0; i-- {
		products[i] *= product_so_far
		product_so_far *= numbers[i]
	}

	return products
}
