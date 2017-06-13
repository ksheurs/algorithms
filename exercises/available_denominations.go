// Write a function that, given: 1) an amount of money and 2) an array of coin
// denominations computes the number of ways to make the amount of money with
// coins of the available denominations.
//
// Ex 4¢ and [1¢, 2¢, 3¢] would be `4`:
// 1¢, 1¢, 1¢, 1¢
// 1¢, 1¢, 2¢
// 1¢, 3¢
// 2¢, 2¢
package main

import (
	"fmt"
	"strconv"
	"strings"
)

var (
	amount        = 4
	denominations = [3]int{1, 2, 3}
	cache         = make(map[string]int)
)

func main() {
	x := Possibilities(amount, 0)
	fmt.Println(x)
}

func Possibilities(amount int, i int) int {
	key := strings.Join(
		[]string{strconv.Itoa(amount), strconv.Itoa(i)},
		":",
	)

	if val, ok := cache[key]; ok {
		fmt.Println("Cached value", key)
		return val
	}

	if amount == 0 {
		return 1
	}

	if amount < 0 || i == len(denominations) {
		return 0
	}

	fmt.Printf("Amount %d with %v\n", amount, denominations[i:])

	num := 0
	for amount >= 0 {
		num += Possibilities(amount, i+1)
		amount -= denominations[i]
	}
	cache[key] = num
	return num
}
