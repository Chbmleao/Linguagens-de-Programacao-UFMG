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


def removeAll(s):
    """Removes all the elements from the data structure."""
    while s.hasMore():
        print(s.remove())
