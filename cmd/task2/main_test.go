package main

import "testing"

func TestAdder(t *testing.T) {
	sum := add(3, 2)
	expected := 5

	if sum != expected {
		t.Errorf("expected '%d' but got '%d'", expected, sum)
	}
}