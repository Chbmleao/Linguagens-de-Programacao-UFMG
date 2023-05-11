from permutacao import perm
from crivoEratostenes import sievePrimes0
from functools import reduce


def listToInt(list):
    listSize = len(list)
    p = 10 ** (listSize - 1)
    num = 0
    for x in list:
        num += p * x
        p = p / 10

    return int(num)


def isPermutation(x, y):
    xList = [int(digit) for digit in str(x)]
    yList = [int(digit) for digit in str(y)]

    if len(xList) < 4:
        xList.append(0)

    if len(yList) < 4:
        yList.append(0)

    for xDigit in xList:
        if xDigit not in yList:
            return False

    return True


fourDigitNumsList = perm(4, [0, 1, 2, 3, 4, 5, 6, 7, 8, 9])

fourDigitNums = list(
    reduce((lambda acc, x: acc + [listToInt(x)]), fourDigitNumsList, [])
)


fourDigitPrimes = list(sievePrimes0([*range(2, 10000)]))

fourDigits = []
for x in fourDigitNums:
    for num in fourDigitPrimes:
        if x == num:
            fourDigits.append(x)

permutations = []
for i in range(0, len(fourDigits)):
    for j in range(i + 1, len(fourDigits)):
        if isPermutation(fourDigits[i], fourDigits[j]):
            for k in range(j + 1, len(fourDigits)):
                if isPermutation(fourDigits[j], fourDigits[k]):
                    permutations.append([fourDigits[i], fourDigits[j], fourDigits[k]])

finalPerms = []
for p in permutations:
    if p[2] - p[1] == p[1] - p[0]:
        finalPerms.append(p)

print(finalPerms)
