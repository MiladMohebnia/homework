proc AvalNo {} {

	puts "Enter Input :"
	gets stdin x

	puts "*******************************************"
	puts "Press Any Key to Show Result:"
	gets stdin t

	if {$x == 1} {
		return "No"
	}
	for { set i 2 } { $i <= 9 } { incr i } {
		if {$x%$i == 0 } {
			if {$x != $i} {
				return "No"
			}
		}
	}
	return "Yes"
}

set y [AvalNo]
puts "$y"

