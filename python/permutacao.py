from functools import reduce


def perm(n, list):
    if n <= 1:
        return reduce((lambda acc, e: acc + [[e]]), list, [])

    finalList = []
    minorList = perm(n - 1, list)
    for x in list:
        for p in minorList:
            if x not in p:
                finalList += [[x] + p]

    return finalList
