proc Desc {} {

	puts "Enter x1 :"
	gets stdin x1

	puts "Enter x2 :"
	gets stdin x2

	puts "Enter x3 :"
	gets stdin x3

	puts "*******************************************"
	puts "Press Any Key to Be Sort Descending :"

	gets stdin
	#----------------- Sorting ---------------------

	if {$x1 >= $x2} {
		set r(1) $x1
		set r(2) $x2
	}
	if {$x1 < $x2} {
		set r(1) $x2
		set r(2) $x1
	}
	#--
	if {$r(1) >= $x3} {
		if {$r(2) >= $x3} {
			set r(3) $x3
		}
		if {$r(2) < $x3} {
			set r(3) $r(2)
			set r(2) $x3
		}
	}
	if {$r(1) < $x3} {
		set r(3) $r(2)
		set r(2) $r(1)
		set r(1) $x3

}
#--------------------------------------

puts "$r(1) , $r(2) , $r(3)"
}

set y [Desc]
puts "$y"

