class Worklist:
    """Describes a simple list data type."""

    def add(self, element):
        """Adds a new element into this list."""

    def remove(self):
        """Removes the next element from this list."""

    def hasMore(self):
        """Returns True if this list is not empty."""


class Node:
    """The node that must be inserted into the different lists."""

    def __init__(self):
        self.n = 0
        self.e = ""


class Stack:
    """Describes a stack data type."""

    def __init__(self):
        self.top = Node()

    def add(self, element):
        """Adds a new element into this list."""
        self.top.e = element
        aux = Node()
        aux.n = self.top
        self.top = aux

    def remove(self):
        """Removes the next element from this list."""
        self.top = self.top.n
        return self.top.e

    def hasMore(self):
        """Returns True if this list is not empty."""
        return self.top.n != 0


class Queue:
    """Describes a queue data type."""

    def __init__(self):
        self.first = Node()
        self.last = self.first

    def add(self, element):
        """Adds a new element into this list."""
        self.last.e = element
        aux = Node()
        self.last.n = aux
        self.last = aux

    def remove(self):
        """Removes the next element from this list."""
        self.first = self.first.n
        return self.first.e

    def hasMore(self):
        """Returns True if this list is not empty."""
        return self.first.n != 0


class PriorityQueue:
    """Describes a queue data type."""

    def __init__(self):
        self.first = Node()
        self.last = self.first

    def add(self, element):
        """Adds a new element into this list."""
        self.last.e = element
        aux = Node()
        self.last.n = aux
        self.last = aux

    def remove(self):
        """Removes the next element from this list."""
        currNode = self.first
        if self.first.n.n == 0:
            aux = self.first.e
            self.first = Node()
            return aux

        prevNode = currNode
        currNode = currNode.n

        prevMinorNode = self.first
        minorNode = self.first
        while currNode.n != 0:
            if currNode.e < minorNode.e:
                minorNode = currNode
                prevMinorNode = prevNode
            prevNode = currNode
            currNode = currNode.n

        if self.first == minorNode:
            self.first = minorNode.n
            return minorNode.e
        if self.last == minorNode:
            self.last = prevMinorNode

        prevMinorNode.n = minorNode.n

        return minorNode.e

    def hasMore(self):
        """Returns True if this list is not empty."""
        return self.first.n != 0


def removeAll(s):
    """Removes all the elements from the data structure."""
    while s.hasMore():
        print(s.remove())


s = PriorityQueue()
print(s.hasMore())
s.add("a")
s.add("c")
s.add("b")
removeAll(s)
