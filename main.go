package main

import (
	"fmt"

	. "github.com/ksheurs/algorithms/queue"
	. "github.com/ksheurs/algorithms/search"
	. "github.com/ksheurs/algorithms/sort"
	. "github.com/ksheurs/algorithms/stack"
	. "github.com/ksheurs/algorithms/tree"
)

func main() {
	fmt.Println("")

	fmt.Println("Bubble Sort:")
	BubbleSort()

	fmt.Println("")

	fmt.Println("Binary Search:")
	BinarySearch()

	fmt.Println("")

	fmt.Println("Binary Tree:")
	BinaryTreeExample()

	fmt.Println("")

	fmt.Println("Queue:")
	QueueExample()

	fmt.Println("")

	fmt.Println("Stack:")
	StackExample()

	fmt.Println("")

	fmt.Println("Breadth-First Search:")
	BreadthFirstSearch()

	fmt.Println("")

	fmt.Println("Depth-First Search:")
	DepthFirstSearch()

	fmt.Println("")

	fmt.Println("Merge Sort:")
	MergeSort()

	fmt.Println("")
}
