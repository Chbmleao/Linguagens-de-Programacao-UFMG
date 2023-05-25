import time


def isPermutation(x, y):
    digitsX = str(x)
    digitsY = str(y)

    if len(digitsX) != len(digitsY):
        return False

    frequency = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

    for d in digitsX:
        frequency[int(d)] += 1

    for d in digitsY:
        if frequency[int(d)] > 0:
            frequency[int(d)] -= 1
        else:
            return False

    return True if sum(frequency) == 0 else False


def euler62(numPerm):
    currNum = 0
    perms = {}
    while True:
        currCube = currNum**3
        inserted = False
        for p in perms:
            if isPermutation(currCube, p):
                perms[p].append(currCube)
                if len(perms[p]) == numPerm - 1:
                    return [p] + perms[p]
                inserted = True
                break
        if not inserted:
            perms[currCube] = []

        nextCube = (currNum + 1) ** 3
        if len(str(currCube)) > len(str(nextCube)):
            perms = {}

        currNum += 1


startTime = time.perf_counter()

print(euler62(6))

endTime = time.perf_counter()
elapsedTime = endTime - startTime

print(f"Elapsed time: {elapsedTime:.6f} seconds")
