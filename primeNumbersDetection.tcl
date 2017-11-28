#proc to check if the number is prime or not. if it's prime it returns true
proc isPrime { number } {
	#if number is lower than 1 then it's not prime
	#if number is 2 or 3 then it's prime
	#if number can devide by 2 or 3 then it's not prime
	if { $number <= 1 } { 
		return false 
	} elseif { $number <= 3 } { return true 
	} elseif { [expr $number % 2] == 0 || [expr $number % 3] == 0 } { return false }

	#as 4 is devide by 2 then we start from 5
	# we make a loop to check
	for { set i 5 }  {[expr $i * $i] <= $number} {set i [expr $i + 6]} {
	   if { [expr $number % $i] == 0 || [expr $number % ($i + 2)] == 0  } {
	   	return false
	   }
	}
	#if there's no match at all then it's prime
	return true
}

puts " Menu : choose the action :"
puts "1 ) Enter your number"
puts "2 ) check from 0 to 100 and return all prime numbers"
gets stdin menu
if { $menu == 1 } {
	puts "enter your number and press the key enter:"
	gets stdin x
	if { [isPrime $x] } {
		puts "$x is a prime number"
	} {
		puts "$x is not a prime number"
	}
} elseif { $menu == 2 } {
	puts "-------------------------"
	for { set i 0 } { $i < 101 } { incr i } {
		if { [isPrime $i] } {
			puts $i
		} 
	}
}