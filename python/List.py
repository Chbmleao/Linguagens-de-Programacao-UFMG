import sys
import math


class ConsCell:
    def __init__(self, h, t):
        """Creates a new cell with head == h, and tail == t."""
        self.head = h
        self.tail = t


class List:
    """Describes a simple list data type."""

    def __init__(self, n):
        """creates a new list with n as the first element."""
        self.start = n

    def cons(self, e):
        """Adds a new element into the list; hence, procuding a new list."""
        return List(ConsCell(e, self.start))

    def length(self):
        """Returns the number of elements in the list."""
        len = 0
        cell = self.start
        while cell != 0:
            len += 1
            cell = cell.tail
        return len

    def __str__(self):
        """Returns a textual representation of this list."""
        ans = "["
        cell = self.start
        while cell != 0:
            ans = ans + repr(cell.head)
            cell = cell.tail
            if cell != 0:
                ans = ans + ", "
        ans = ans + "]"
        return ans

    def contains(self, n):
        """Returns true if this list contains n else false"""
        cell = self.start
        while cell != 0:
            if cell.head == n:
                return True
            cell = cell.tail

        return False

    def equals(self, list):
        """Returns true if this list is equal to another list"""
        if self.length() != list.length():
            return False

        cell1 = self.start
        cell2 = list.start
        while cell1 != 0 and cell2 != 0:
            if cell1.head != cell2.head:
                return False
            cell1 = cell1.tail
            cell2 = cell2.tail

        return True

    def append(self, list):
        """Returns this list appended to another list"""
        retList = self
        auxArr = []
        cell = list.start
        while cell != 0:
            auxArr.append(cell.head)
            cell = cell.tail

        for i in reversed(range(len(auxArr))):
            retList = retList.cons(auxArr[i])

        return retList

    def auxRecursiveAppend(self, cell):
        if cell == 0:
            return self
        retList = self.auxRecursiveAppend(cell.tail)
        return retList.cons(cell.head)

    def recursiveAppend(self, list):
        return self.auxRecursiveAppend(list.start)

    def reverse(self):
        retList = List(0)
        cell = self.start
        while cell != 0:
            retList = retList.cons(cell.head)
            cell = cell.tail

        return retList

    def reverseMe(self):
        n = self.length()
        middle = math.floor(n / 2)
        cell1 = self.start
        cell2 = self.start

        for i in range(middle):
            for j in range(n - 1):
                cell2 = cell2.tail

            aux = cell1.head
            cell1.head = cell2.head
            cell2.head = aux
            n -= 1
            cell1 = cell1.tail
            cell2 = self.start

    def sort(self, comp=lambda x, y: x < y):
        retList = List(0)
        inserted = []
        while retList.length() < self.length():
            cell = self.start
            minor = sys.maxsize
            while cell != 0:
                if comp(cell.head, minor) and cell.head not in inserted:
                    minor = cell.head
                cell = cell.tail

            retList = retList.cons(minor)
            inserted.append(minor)

        return retList

    def sortMe(self):
        if self.length() == 1:
            return

        firstCell = self.start
        secondCell = firstCell.tail
        if firstCell.head > secondCell.head:
            firstCell.tail = secondCell.tail
            secondCell.tail = firstCell
            self.start = secondCell
        if self.length() == 2:
            return

        swapped = True
        while swapped:
            prevCell = self.start
            currCell = prevCell.tail
            nextCell = currCell.tail
            swapped = False

            while nextCell != 0:
                if currCell.head > nextCell.head:
                    currCell.tail = nextCell.tail
                    nextCell.tail = currCell
                    prevCell.tail = nextCell

                    if currCell == self.start:
                        self.start = nextCell

                    aux = currCell
                    currCell = nextCell
                    nextCell = aux

                    swapped = True

                prevCell = prevCell.tail
                currCell = currCell.tail
                nextCell = nextCell.tail


def test():
    a = List(0)
    b = a.cons(2)
    c = b.cons("Hi!")
    d = b.cons(True)
    e = d.cons(False)
    f = d.append(e)
    h = b.cons(10)
    h = h.cons(1)
    h = h.cons(7)
    h.reverseMe()
    print("List a = ", a.__str__(), " Length(a) = ", a.length())
    print("List b = ", b.__str__(), " Length(b) = ", b.length())
    print("List c = ", c.__str__(), " Length(c) = ", c.length())
    print("List d = ", d.__str__(), " Length(d) = ", d.length())
    print("List e = ", e.__str__(), " Length(e) = ", e.length())
    print("List f = ", f.__str__(), " Length(f) = ", f.length())
    # print("List g = ", g.__str__(), " Length(g) = ", g.length())
    print("List h = ", h.__str__(), " Length(g) = ", h.length())


test()
