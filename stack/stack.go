package stack

import (
	"fmt"
	"sync"
)

// Stack is the main stack struct
type Stack struct {
	current *StackItem
	depth   int
	lock    *sync.Mutex
}

// StackItem holds the item and neighbor of an entry in the stack
type StackItem struct {
	item interface{}
	next *StackItem
}

// NewStack initializes a new stack
func NewStack() *Stack {
	return &Stack{
		current: nil,
		depth:   0,
		lock:    &sync.Mutex{},
	}
}

func (s *Stack) Push(i interface{}) {
	s.lock.Lock()
	defer s.lock.Unlock()

	s.current = &StackItem{item: i, next: s.current}
	s.depth++
}

func (s *Stack) Pop() interface{} {
	s.lock.Lock()
	defer s.lock.Unlock()

	if s.depth == 0 {
		return nil
	}

	item := s.current.item
	s.current = s.current.next
	s.depth--

	return item
}

func (s *Stack) Peek() interface{} {
	s.lock.Lock()
	defer s.lock.Unlock()

	if s.depth == 0 {
		return nil
	}

	return s.current.item
}

// StackExample runs an example of the Stack implementation
func StackExample() {
	stack := NewStack()

	stack.Push("One")
	stack.Push("Two")
	stack.Push("Three")
	stack.Push("Four")
	stack.Push("Five")

	for {
		item := stack.Pop()

		if item == nil {
			break
		}

		fmt.Printf("Size: %d, Popped Item: %v\n", stack.depth, item)
	}
}
