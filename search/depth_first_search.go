package search

import (
	"fmt"

	. "github.com/ksheurs/algorithms/tree"
)

// DepthFirstSearch implements DFS on a binary tree
func DepthFirstSearch() {
	tree := buildBinaryTree()
	stack := &NodeStack{}

	stack.Push(tree.Head)

	for stack.Depth() > 0 {
		node := stack.Pop()
		fmt.Println(node.Value)

		if node.Left != nil && !node.Left.Visited {
			stack.Push(node.Left)
		}

		if node.Right != nil && !node.Right.Visited {
			stack.Push(node.Right)
		}
	}
}

// NodeStack is a stack of nodes
type NodeStack []*Node

// Push appends a node to the stack
func (q *NodeStack) Push(n *Node) {
	*q = append(*q, n)
}

// Peek returns the top node, but doesn't remove it
func (q *NodeStack) Peek() (n *Node) {
	x := q.Depth() - 1
	return (*q)[x]
}

// Pop returns and removes the top node from the stack
func (q *NodeStack) Pop() (n *Node) {
	x := q.Depth() - 1
	n = (*q)[x]
	*q = (*q)[:x]
	return
}

// Depth returns the size of the stack
func (q *NodeStack) Depth() int {
	return len(*q)
}
