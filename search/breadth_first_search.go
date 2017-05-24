package search

import (
	"fmt"

	. "github.com/ksheurs/algorithms/tree"
)

// BreadthFirstSearch implements BFS on a binary tree, printing by level
func BreadthFirstSearch() {
	tree := buildBinaryTree()
	queue := &NodeQueue{}

	queue.Enqueue(tree.Head)

	for queue.Depth() > 0 {
		level := queue.Depth()

		for level > 0 {
			node := queue.Dequeue()
			fmt.Printf("%d ", node.Value)

			if node.Left != nil {
				queue.Enqueue(node.Left)
			}

			if node.Right != nil {
				queue.Enqueue(node.Right)
			}

			level--
		}

		fmt.Println("")
	}
}

// NodeQueue is a queue of nodes
type NodeQueue []*Node

// Enqueue appends a node to the queue
func (q *NodeQueue) Enqueue(n *Node) {
	*q = append(*q, n)
}

// Dequeue removes a node from the queue
func (q *NodeQueue) Dequeue() (n *Node) {
	n = (*q)[0]
	*q = (*q)[1:]
	return
}

// Depth returns the size of the queue
func (q *NodeQueue) Depth() int {
	return len(*q)
}
