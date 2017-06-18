# Given a linkedlist of integers and an integer value, delete every node of the
# linkedlist containing that value.
class Tree
    attr_accessor :head

    def initialize(head: head)
        @head = head
    end
end

class Node
    attr_accessor :value, :next

    def initialize(value: value)
        @value = value
        @next = nil
    end
end

class LinkedListRemoval
    attr_reader :tree

    def initialize
        @tree = Tree.new(
            head: Node.new(value: 8)
        )

        node = tree.head
        [4, 3, 5, 6, 5, 5, 9].each do |value|
            node.next = Node.new(value: value)
            node = node.next
        end
    end

    def remove(n)
        result = []

        while tree.head != nil
            if tree.head.value != n
                break
            end

            tree.head = tree.head.next
        end

        node = tree.head

        if node != nil
            result = [node.value]
            while node.next != nil
                current = node
                node = current.next

                if node.value == n
                    current.next = node.next
                else
                    result << node.value
                end
            end
        end

        puts result.inspect
    end
end

LinkedListRemoval.new.remove(5)
