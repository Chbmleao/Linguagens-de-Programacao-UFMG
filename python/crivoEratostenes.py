import time


def sievePrimes0(candidates):
    """Removes every non-prime number from the ordered list l."""
    for i in range(0, int(len(candidates) ** 0.5 + 1)):
        currentPrime = candidates[i]
        if currentPrime != 0:
            for j in range(i + currentPrime, len(candidates), currentPrime):
                if candidates[j] % candidates[i] == 0:
                    candidates[j] = 0

    return filter(lambda x: x != 0, candidates)


def sievePrimes1(l):
    """Removes every non-prime number from the ordered list l."""
    if l[0] * l[0] <= l[len(l) - 1]:
        aux = l[0]
        l[1:] = sievePrimes1(list(filter(lambda x: x % aux != 0, l)))
    return l


def timeSieve(maxPrime, numTimes, sieveFunc):
    """Times the sieve implementations."""
    t0 = 0
    for numTries in range(0, numTimes):
        taux = time.perf_counter()
        primes0 = sieveFunc([*range(2, maxPrime)])
        t0 = t0 + time.perf_counter() - taux
    print(t0 / numTimes)


def completeTestPrimes():
    print("10: ")
    print("Imperativo:")
    timeSieve(10, 1000, sievePrimes0)
    print("Declarativo:")
    timeSieve(10, 1000, sievePrimes1)
    print()

    print("50: ")
    print("Imperativo:")
    timeSieve(50, 1000, sievePrimes0)
    print("Declarativo:")
    timeSieve(50, 1000, sievePrimes1)
    print()

    print("100: ")
    print("Imperativo:")
    timeSieve(100, 1000, sievePrimes0)
    print("Declarativo:")
    timeSieve(100, 1000, sievePrimes1)
    print()

    print("500: ")
    print("Imperativo:")
    timeSieve(500, 1000, sievePrimes0)
    print("Declarativo:")
    timeSieve(500, 1000, sievePrimes1)
    print()

    print("1000: ")
    print("Imperativo:")
    timeSieve(1000, 1000, sievePrimes0)
    print("Declarativo:")
    timeSieve(1000, 1000, sievePrimes1)
    print()

    print("10000: ")
    print("Imperativo:")
    timeSieve(10000, 1000, sievePrimes0)
    print("Declarativo:")
    timeSieve(10000, 1000, sievePrimes1)
    print()

    print("100000: ")
    print("Imperativo:")
    timeSieve(100000, 1000, sievePrimes0)
    print("Declarativo:")
    timeSieve(100000, 1000, sievePrimes1)
    print()


def testPrimes():
    numTimes = int(input("Quantas vezes a função crivo deve ser chamada? "))
    maxPrime = int(input("Qual deve ser o tamanho do crivo gerado? "))

    timeSieve(maxPrime, numTimes, sievePrimes0)
    timeSieve(maxPrime, numTimes, sievePrimes1)
