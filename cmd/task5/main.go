package main

func sums(numbers []int) int {
	sum := 0
	for _, number := range numbers {
		sum += number
	}
	return sum
}