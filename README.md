# Instructions for run the app

Make executable file for lex and yacc 
1. >cd node-app/lex&yacc 
2. >make

create 2 tap interfaces
3. Go to RIOT/dist/tools/tapsetup
4. >./tapsetup -c 2

create server in a node
5. Go to node-app 
6. >make all term PORT=tap0
7. >ifconfig
	then you get output like this
		
	Iface  5   HWaddr: 96:a3:95:d6:ab:d8 
           
           MTU:1500  HL:64  
           Source address length: 6
           Link type: wired
           inet6 addr: ff02::1/128  scope: local [multicast]
           inet6 addr: fe80::94a3:95ff:fed6:abd8/64  scope: local 
           inet6 addr: ff02::1:ffd6:abd8/128  scope: local [multicast]
	
	ip address of this node(server) is fe80::94a3:95ff:fed6:abd8 under scope: local

8. >udp server start \<portnumber\> ex:8080

send query from base-station

9. Go to base-station
10. >udp send \<serverip\> \<serverport\> "query"
	query must be include between two double quotes.


