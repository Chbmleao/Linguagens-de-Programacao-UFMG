class Node:
    def __init__(self, value=None):
        self.value = value
        self.left = None
        self.right = None


class MySet:
    def __init__(self):
        self.top = Node()

    def find(self, value):
        currNode = self.top
        while currNode != None:
            if value < currNode.value:
                currNode = currNode.left
            elif value > currNode.value:
                currNode = currNode.right
            else:
                return True

        return False

    def add(self, value):
        if self.top.value == None:
            self.top.value = value
        else:
            prevNode = self.top
            currNode = self.top
            while currNode != None:
                prevNode = currNode
                if value < currNode.value:
                    currNode = currNode.left
                else:
                    currNode = currNode.right

            if prevNode.value > value:
                prevNode.left = Node(value)
            else:
                prevNode.right = Node(value)

    def auxStr(self, node):
        if node == None:
            return ""
        leftStr = self.auxStr(node.left)
        rightStr = self.auxStr(node.right)
        if leftStr != "":
            leftStr += ", "

        if rightStr != "":
            rightStr = ", " + rightStr
        return leftStr + str(node.value) + rightStr

    def __str__(self):
        return "{" + self.auxStr(self.top) + "}"


s = MySet()
s.add(1)
s.add(10)
s.add(4)
s.add(17)
s.add(5)
s.add(2)
s.add(3)
print(s.find(3))

print(s)
