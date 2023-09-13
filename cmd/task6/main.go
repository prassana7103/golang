package main

import ("math")

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