#finishing procedure
proc finish {} {
  global sim trFile namFile
  $sim flush-trace
  close $namFile
  close $trFile
  exec nam {3.outputfile.nam} &
  exit 0
}

#setting the simulator
set sim [new Simulator]

#setting the outputfile
set trFile [open {3.outputfile.tr} w]
$sim trace-all $trFile
set namFile [open {3.outputfile.nam} w]
$sim namtrace-all $namFile

#setting up the network
#defining nodes
set node0 [$sim node]
$node0 label "N0"

set node1 [$sim node]
set node2 [$sim node]
set node3 [$sim node]
set node4 [$sim node]

#defining connections and orients
$sim duplex-link $node0 $node1 1Mb 10ms DropTail
$sim duplex-link-op $node0 $node1 orient right

$sim duplex-link $node1 $node3 1Mb 10ms DropTail
$sim duplex-link-op $node1 $node3 orient down

$sim duplex-link $node0 $node2 1Mb 20ms DropTail
$sim duplex-link-op $node0 $node2 orient down

$sim duplex-link $node2 $node4 1Mb 15ms DropTail
$sim duplex-link-op $node2 $node4 orient right-up

$sim duplex-link $node2 $node3 2Mb 15ms DropTail
$sim duplex-link-op $node2 $node3 orient right

#CBR over UDP
set udp [new Agent/UDP]
set null [new Agent/Null]

$udp set fid_ 1
$sim color 1 red

$sim attach-agent $node0 $udp
$sim attach-agent $node3 $null
$sim connect $udp $null

set cbr [new Application/Traffic/CBR]
$cbr attach-agent $udp
$cbr set packetSize_ 1000
$cbr set rate_ 0.8mb


#FTP over TCP
set tcp [new Agent/TCP]
set sink [new Agent/TCPSink/DelAck]

$sim attach-agent $node1 $tcp
$sim attach-agent $node4 $sink
$sim connect $tcp $sink

set ftp [new Application/FTP]
$ftp set type_ FTP
$ftp attach-agent $tcp

$sim at 0.00001 "$cbr start"
$sim at 1.2 "$cbr stop"

$sim at 0.3 "$ftp start"
$sim at 1.4 "$ftp stop"

$sim at 1.4 "finish"

$sim run
