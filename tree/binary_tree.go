package tree

import (
	"errors"
	"fmt"
)

// Node represents a node in Tree
type Node struct {
	Value   int
	Left    *Node
	Right   *Node
	Parent  *Node
	Visited bool
}

// Tree is a binary tree
type Tree struct {
	Head *Node
	Size int
}

// NewNode creates a new node for a given value
func NewNode(i int) *Node {
	return &Node{Value: i, Visited: false}
}

// NewTree creates a new tree for an initial node/head
func NewTree(n *Node) *Tree {
	if n == nil {
		return &Tree{}
	}

	return &Tree{
		Head: n,
		Size: 1,
	}
}

// Compare evalutes the value of self (n1) vs the value of Node (n2)
func (n1 *Node) Compare(n2 *Node) int {
	if n1.Value < n2.Value {
		return -1
	}

	if n1.Value > n2.Value {
		return 1
	}

	return 0
}

// Insert adds a node to the binary tree
func (t *Tree) Insert(i int) {
	node := NewNode(i)

	if t.Head == nil {
		t.Head = node
		t.Size++
		return
	}

	head := t.Head

	for {
		if node.Compare(head) == -1 {
			if head.Left == nil {
				head.Left = node
				head.Left.Parent = head
				break
			}
			head = head.Left
		} else {
			if head.Right == nil {
				head.Right = node
				head.Right.Parent = head
				break
			}
			head = head.Right
		}
	}

	t.Size++
}

// Search finds the node in the tree for a given value
func (t *Tree) Search(i int) (*Node, error) {
	head := t.Head
	node := NewNode(i)

	for head != nil {
		switch head.Compare(node) {
		case -1:
			head = head.Right
			break

		case 1:
			head = head.Left
			break

		case 0:
			return node, nil
		}
	}

	return nil, errors.New("Node not found")
}

// BinaryTreeExample runs an example of the BinaryTree implementation
func BinaryTreeExample() {
	tree := NewTree(&Node{
		Value: 7,
	})

	tree.Insert(4)
	tree.Insert(6)
	tree.Insert(1)
	tree.Insert(8)

	node, err := tree.Search(1)

	if err != nil {
		fmt.Println(err.Error())
	} else {
		fmt.Println("Search for node 1:", node)
	}
}
