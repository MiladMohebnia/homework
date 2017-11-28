proc bubbleSort { inputList } {
	upvar $inputList inp

	for {set i [expr [array size inp] - 1]} { $i >= 0 } {set i [expr $i - 1]} {
		for {set j 0} { $j <= [expr $i - 1] } {incr j} {
			if {$inp($j) < $inp([expr $j + 1])} {
				set t $inp($j)
				set inp($j) $inp([expr $j + 1])
				set inp([expr $j + 1]) $t		
			}
		}
	}

	return [array get inp]
}


puts {please enter 3 numbers and press Enter button each time}
gets stdin inputList(0)
gets stdin inputList(1)
gets stdin inputList(2)


array set sortedArray [bubbleSort inputList]

parray sortedArray
