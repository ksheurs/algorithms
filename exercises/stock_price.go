// Write an efficient function that takes yesterdays stock prices and returns
// the best profit I could have made from 1 purchase and 1 sale of 1 Apple
// stock yesterday.
package main

import "fmt"

func main() {
	prices := []int{10, 7, 5, 8, 11, 9}

	profit := GetMaxProfit(prices)
	fmt.Println(profit)

	profit = GetMaxProfitOptimized(prices)
	fmt.Println(profit)
}

func GetMaxProfit(prices []int) int {
	profits := make(map[int]int, len(prices))
	max := 0

	for i := 0; i < len(prices); i++ {
		profits[i] = 0

		for j := i + 1; j < len(prices); j++ {
			profit := prices[j] - prices[i]

			if profit > profits[i] {
				profits[i] = profit
			}
		}

		if profits[i] > max {
			max = profits[i]
		}
	}

	return max
}

func GetMaxProfitOptimized(prices []int) int {
	minPrice := prices[0]
	maxProfit := prices[1] - prices[0]

	for _, price := range prices {
		potentialProfit := price - minPrice

		if potentialProfit > maxProfit {
			maxProfit = potentialProfit
		}

		if price < minPrice {
			minPrice = price
		}
	}

	return maxProfit
}
