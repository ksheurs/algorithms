package main

import "fmt"

func main() {
	objects := [5]string{"D", "A", "C", "E", "B"}
	indexes := [5]int{3, 0, 2, 4, 1}

	for i := 0; i < len(objects); i++ {
		for indexes[i] != i {
			tmpObject := objects[indexes[i]]
			tmpIndex := indexes[indexes[i]]

			objects[indexes[i]] = objects[i]
			indexes[indexes[i]] = indexes[i]

			objects[i] = tmpObject
			indexes[i] = tmpIndex
		}
	}

	fmt.Println(objects)
}
