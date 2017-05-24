/* +----+----+----+----+----+----+
*  | mk |    |    |    |    | mk |
*  +----+----+----+----+----+----+
*  |wall|wall|wall|    |    |    |
*  +----+----+----+----+----+----+
*  |    |    |wall|    |    |    |
*  +----+----+----+----+----+----+
*  |    |    |    |    |    |    |
*  +----+----+----+----+----+----+
*  |    | mk |    |    |    |    |
*  +----+----+----+----+----+----+
 */
package main

import "fmt"

const Kitchen = "kitchen"
const Wall = "wall"
const Desk = "desk"
const Vacant = "vacant"

var (
	office = [5][6]string{
		{Kitchen, Vacant, Vacant, Vacant, Vacant, Kitchen},
		{Wall, Wall, Wall, Vacant, Vacant, Vacant},
		{Vacant, Vacant, Wall, Vacant, Vacant, Vacant},
		{Vacant, Vacant, Vacant, Vacant, Vacant, Vacant},
		{Vacant, Kitchen, Vacant, Vacant, Vacant, Vacant},
	}

	maxSteps = 3
)

func main() {
	for row := 0; row < len(office); row++ {
		for col := 0; col < len(office[row]); col++ {
			index := office[row][col]

			if index == Kitchen {
				addDesks(row, col, 0)
			}
		}
	}

	printOffice()

	if validOffice() {
		fmt.Println("Answer: Valid!")
	} else {
		fmt.Println("Answer: Invalid!")
	}
}

func addDesks(row int, col int, step int) {
	if row < 0 || col < 0 || step > maxSteps {
		return
	}

	if row > len(office)-1 || col > len(office[0])-1 {
		return
	}

	if office[row][col] == Wall || office[row][col] == Desk {
		return
	}

	if office[row][col] == Vacant {
		office[row][col] = Desk
	}

	step++
	addDesks(row-1, col, step)
	addDesks(row+1, col, step)
	addDesks(row, col-1, step)
	addDesks(row, col+1, step)
}

func printOffice() {
	for i := 0; i < len(office); i++ {
		fmt.Println(office[i])
	}
}

func validOffice() bool {
	valid := true

	for row := 0; row < len(office); row++ {
		for col := 0; col < len(office[row]); col++ {
			if office[row][col] == Vacant {
				valid = false
			}
		}
	}

	return valid
}
