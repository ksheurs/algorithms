package queue

import (
	"fmt"
	"sync"
)

// Queue is the main queue struct
type Queue struct {
	current *QueueItem
	depth   int
	last    *QueueItem
	lock    *sync.Mutex
}

// QueueItem holds the item and neighbor of an entry in the queue
type QueueItem struct {
	item interface{}
	prev *QueueItem
}

// NewQueue initializes a new queue
func NewQueue() *Queue {
	return &Queue{
		current: nil,
		last:    nil,
		depth:   0,
		lock:    &sync.Mutex{},
	}
}

// Enqueue adds an item to the queue
func (q *Queue) Enqueue(i interface{}) {
	q.lock.Lock()
	defer q.lock.Unlock()

	item := &QueueItem{item: i, prev: nil}

	if q.depth == 0 {
		q.current = item
		q.last = q.current
	} else {
		q.last.prev = &QueueItem{item: i, prev: nil}
		q.last = q.last.prev
	}

	q.depth++
}

// Dequeue removes and returns the next item in the queue
func (q *Queue) Dequeue() interface{} {
	q.lock.Lock()
	defer q.lock.Unlock()

	if q.depth == 0 {
		return nil
	}

	item := q.current.item
	q.current = q.current.prev
	q.depth--

	return item
}

// Depth returns the number of items in the queue
func (q *Queue) Depth() int {
	return q.depth
}

// QueueExample runs an example of the Queue implementation
func QueueExample() {
	queue := NewQueue()

	queue.Enqueue("One")
	queue.Enqueue("Two")
	queue.Enqueue("Three")
	queue.Enqueue("Four")
	queue.Enqueue("Five")

	for {
		item := queue.Dequeue()

		if item == nil {
			break
		}

		fmt.Printf("Size: %d, Dequeued Item: %v\n", queue.depth, item)
	}
}
