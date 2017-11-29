# trying set and puts command
set x 1
set y [expr 12+15]
puts $x
puts $y
#trying if
if {$x >= 2} {puts "good to go"} {puts "not good to go"}
#trying get
	# puts "Enter your name : " 
	# gets stdin z
	# puts "you entered $z"
# trying array
set languages(0) Tcl
set languages(1) "C Language"
puts $languages(0)
puts $languages(1)
puts [array size languages] 


#multy line comment
if 0 {
	here's a multy line comment that's not going to
	effect the application
}

#testing procidures

proc foo {} {
	return 1;
}

puts [foo]