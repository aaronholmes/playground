import math

def solution (number):
	intialDivisor = int(math.sqrt(number))

	for i in range(0,intialDivisor):
		if number % (intialDivisor-i) == 0:
			if isprime(intialDivisor-i):
				return intialDivisor-i

def isprime(number):
	if number == 2: 
		return True
	for i in range (2,number):
		if number % i == 0:
			return False
	return True

print solution(13195)
print solution(600851333475143)