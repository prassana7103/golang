package main

import"testing"

func TestIteration (t *testing.T){
	iterate := Iteration("A")
	expected := "AAAAA"

	if iterate != expected {
		t.Errorf("expected '%q' but got '%q'", expected, iterate)
	}
}