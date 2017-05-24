package search

import . "github.com/ksheurs/algorithms/tree"

func buildBinaryTree() *Tree {
	node := NewNode(7)
	tree := NewTree(node)

	tree.Insert(4)
	tree.Insert(6)
	tree.Insert(3)
	tree.Insert(1)
	tree.Insert(10)
	tree.Insert(8)
	tree.Insert(9)
	tree.Insert(14)

	return tree
}
