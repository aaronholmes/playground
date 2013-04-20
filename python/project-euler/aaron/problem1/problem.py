def solution(number):
	multiples = 0

	for i in range(1,number):
		if i%3 == 0 or i%5 ==0:
			multiples += i

	return multiples

print solution(10)
print solution (1000)