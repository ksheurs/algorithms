// Remove all duplicates from a given string
package main

import (
	"fmt"
	"sort"
	"strings"
)

func main() {
	str := SortString("geeksforgeeks")
	chars := strings.Split(str, "")

	size := 1
	for i := 1; i != len(chars); i++ {
		if chars[i] != chars[i-1] {
			chars[size] = chars[i]
			size++
		}
	}

	str = strings.Join(chars[0:size], "")
	fmt.Println(str)
}

func SortString(s string) string {
	chars := strings.Split(s, "")
	sort.Strings(chars)
	return strings.Join(chars, "")
}
