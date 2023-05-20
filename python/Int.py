class Int:
    def __init__(self, value):
        self.value = value

    def toString(self):
        str(self.value)

    def plus(self, y):
        sum = self.value + y.value
        return Int(sum)

    def minus(self, y):
        sub = self.value - y.value
        return Int(sub)

    def times(self, y):
        mul = self.value * y.value
        return Int(mul)

    def div(self, y):
        div = self.value // y.value
        return Int(div)

    def isPrime(self):
        for i in range(2, self.value // 2 + 1):
            if self.value % i == 0:
                return False
        return True
