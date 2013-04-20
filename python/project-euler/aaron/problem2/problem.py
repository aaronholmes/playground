def solution(number):
	num1 = 1
	num2 = 2
	num3 = 0
	divisor = 2
	answer = 2

	while num2 < number:
		num3 = num1 + num2
		num1 = num2
		num2 = num3

		if num2 % divisor == 0:
			answer += num2

	return answer

print solution(4000000)