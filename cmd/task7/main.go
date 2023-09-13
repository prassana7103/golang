package main

import ("math")

type Shape interface {
	Area() float64
}
type rectangle struct {
	Width  float64
	Height float64
}

func (r rectangle) Area() float64 {
	return r.Width * r.Height}

type circle struct {
	Radius float64
}

func (c circle) Area() float64 {
	return math.Pi * c.Radius * c.Radius
}
type triangle struct {
	Base   float64
	Height float64
}

func (t triangle) Area() float64 {
	return (t.Base * t.Height) * 0.5
}